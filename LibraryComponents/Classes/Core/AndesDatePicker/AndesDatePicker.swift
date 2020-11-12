//
//  AndesDatePicker.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 08/11/20.
//

import UIKit

@objc public class AndesDatePicker: UIControl {

    // MARK: - Attributes

    internal var contentView: AndesDatePickerView

    @objc public var startDate: Date
    @objc public var endDate: Date

    internal var didTapped: ((Date) -> Void)?

    @objc public func setDatePickerDate(callback: @escaping ((Date) -> Void)) {
        self.didTapped = callback
    }

    // MARK: - Initializer

    @objc public init(startDate: Date, endDate: Date) {
        let datePickerView = AndesDatePickerDefaultView()
        contentView = datePickerView
        self.startDate = startDate
        self.endDate = endDate
        super.init(frame: .zero)
        setup()
        datePickerView.delegate = self
    }

    required init?(coder: NSCoder) {
        let datePickerView = AndesDatePickerDefaultView()
        contentView = datePickerView
        self.startDate = Date()
        self.endDate = Date()
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.addSubview(contentView)
        contentView.pinToSuperview()
    }
}

extension AndesDatePicker: AndesDatePickerAbstractViewDelegate {
    func didSelectDate(_ date: Date) {
        didTapped?(date)
    }
}
