//
//  AndesDatePickerAbstractView.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation

protocol AndesDatePickerAbstractViewDelegate: class {
    func didSelectDate(_ date: Date)
}

internal class AndesDatePickerAbstractView: UIView, AndesDatePickerView {

    // MARK: - IBOutlet

    @IBOutlet var datePickerView: UIView!
    @IBOutlet var datePickerCollectionView: UICollectionView!
    @IBOutlet var buttonPrimary: AndesButton!

    // MARK: - Attributes

    internal var backgroundLayer: CALayer
    weak var delegate: AndesDatePickerAbstractViewDelegate?
    internal var dataCollectionView: AndesDatePickerSettingCollection?

    internal var selectedDate = Date()
    private lazy var dayCalendar = AndesDayDatePicker()
    private var calendar = Calendar(identifier: .iso8601)
    private lazy var daysToRender = dayCalendar.getDaysInMonth(Date(), selectedDate: selectedDate)

    private var baseDate: Date {
        didSet {
            daysToRender = dayCalendar.getDaysInMonth(baseDate, selectedDate: selectedDate)
            dataCollectionView?.days = daysToRender
            dataCollectionView?.currentDate = baseDate
            datePickerCollectionView.reloadData()
        }
    }

    override public var frame: CGRect {
        didSet {
            datePickerView?.frame = frame
        }
    }

    // MARK: - Instantiate

    internal init() {
        baseDate = Date()
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)
        setup()
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        baseDate = Date()
        self.backgroundLayer = CALayer()
        super.init(coder: coder)
        setup()
        setupCollectionView()
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    // MARK: - Class methods

    private func setup() {
        loadNib()
        datePickerView.layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerView)
        backgroundLayer = datePickerView.layer
        datePickerView.pinToSuperview()

        buttonPrimary.text = "Confirmar"
        buttonPrimary.size = .large
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        datePickerCollectionView.collectionViewLayout = layout
        datePickerCollectionView.isScrollEnabled = false

        dataCollectionView = AndesDatePickerSettingCollection(baseDate: Date(), daysToRender: daysToRender)
        dataCollectionView?.delegate = self
        datePickerCollectionView.dataSource = dataCollectionView
        datePickerCollectionView.delegate = dataCollectionView

        datePickerCollectionView.register(AndesDatePickerCell.self, forCellWithReuseIdentifier: AndesDatePickerCell.identifier)
        datePickerCollectionView.register(AndesDatePickerHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AndesDatePickerHeaderView")
    }

    // MARK: - IBAction

    @IBAction func updateTapped(_ sender: AndesButton) {
        print("button pressed")
    }
}

extension AndesDatePickerAbstractView: AndesDatePickerSettingCollectionDelegate {
    func didSelectDate(_ date: Date) {
        selectedDate = date
        delegate?.didSelectDate(selectedDate)
    }

    func didTouchNextMonth() {
        baseDate = calendar.date(byAdding: .month, value: 1, to: baseDate) ?? baseDate
    }

    func didTouchPreviousMonth() {
        baseDate = calendar.date(byAdding: .month, value: -1, to: baseDate) ?? baseDate
    }
}
