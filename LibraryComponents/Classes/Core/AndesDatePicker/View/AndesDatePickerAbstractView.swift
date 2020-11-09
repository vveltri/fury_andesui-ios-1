//
//  AndesDatePickerAbstractView.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import Foundation

internal class AndesDatePickerAbstractView: UIView, AndesDatePickerView {

    // MARK: - IBOutlet

    @IBOutlet var datePickerView: UIView!
    @IBOutlet var datePickerCollectionView: UICollectionView!
    @IBOutlet var buttonPrimary: AndesButton!

    // MARK: - Attributes

    internal var backgroundLayer: CALayer
    internal var dataCollectionView: AndesDatePickerSettingCollection?

    override public var frame: CGRect {
        didSet {
               datePickerView?.frame = frame
           }
    }

    // MARK: - Instantiate

    internal init() {
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)
        setup()
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
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
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(datePickerView)
        backgroundLayer = datePickerView.layer
        datePickerView.pinToSuperview()
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        datePickerCollectionView.collectionViewLayout = layout

        dataCollectionView = AndesDatePickerSettingCollection()
        datePickerCollectionView.dataSource = dataCollectionView

        datePickerCollectionView.register(AndesCalendarCollectionViewCell.self, forCellWithReuseIdentifier: AndesCalendarCollectionViewCell.identifier)
    }

    // MARK: - IBAction

    @IBAction func updateTapped(_ sender: AndesButton) {
        print("button pressed")
    }
}
