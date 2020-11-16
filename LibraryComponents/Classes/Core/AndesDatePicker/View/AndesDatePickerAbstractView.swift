//
//  AndesDatePickerAbstractView.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation

protocol AndesDatePickerAbstractViewDelegate: class {
    func didSelectDate(_ date: Date?)
}

internal class AndesDatePickerAbstractView: UIView, AndesDatePickerView {

    // MARK: - IBOutlet

    @IBOutlet var datePickerView: UIView!
    @IBOutlet var datePickerCollectionView: UICollectionView!
    @IBOutlet var buttonPrimary: AndesButton!

    // MARK: - Attributes

    internal var backgroundLayer = CALayer()
    weak var delegate: AndesDatePickerAbstractViewDelegate?
    internal var dataCollectionView: AndesDatePickerSettingCollection?

    internal var selectedDate: Date? = Date()
    internal var maxDate: Date?
    private var dayCalendar = AndesDayDatePicker()
    private var calendar = Calendar(identifier: .iso8601)
    private lazy var daysToRender = dayCalendar.getDaysInMonth(Date())

    private var baseDate: Date {
        didSet {
            daysToRender = dayCalendar.getDaysInMonth(baseDate)
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
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        baseDate = Date()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    // MARK: - Class methods

    func setDates(start: Date?, end: Date?) {
        dayCalendar = AndesDayDatePicker(startDate: start, endDate: end)
        setupCollectionView()
    }

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
    func didSelectDate(_ date: Date?) {
        selectedDate = date
        delegate?.didSelectDate(selectedDate)
    }

    func didTouchNextMonth() {
        baseDate = calendar.date(byAdding: .month, value: 1, to: baseDate) ?? baseDate

        print(baseDate)

        print("")
    }

    func didTouchPreviousMonth() {
        baseDate = calendar.date(byAdding: .month, value: -1, to: baseDate) ?? baseDate
    }
}
