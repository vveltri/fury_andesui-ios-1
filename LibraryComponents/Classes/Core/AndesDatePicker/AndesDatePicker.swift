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
    private var datePickerView = AndesDatePickerDefaultView()
    internal var didTapped: ((_ selectedDate: Date?, _ isConfirmed: Bool) -> Void)?

    /// We can initialize this component in two ways:
    /// 1) Passing a deadline by parameter - we block the choice of the date until the date that was passed by parameter (useful for paying bills for example)
    /// 2) Passing nothing by parameter - Works like a normal calendar

    @objc public func setDatePickerDate(maxDate: Date? = nil, callback: @escaping ((_ selectedDate: Date?, _ isConfirmed: Bool) -> Void)) {
        self.didTapped = callback
        datePickerView.setDates(maxDate: maxDate)
    }

    // MARK: - Initializer

    @objc public init() {
        contentView = datePickerView
        super.init(frame: .zero)
        setup()
        datePickerView.delegate = self
    }

    required init?(coder: NSCoder) {
        contentView = datePickerView
        super.init(coder: coder)
        setup()
        datePickerView.delegate = self
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.addSubview(contentView)
        contentView.pinToSuperview()
    }
}

/// Here we have 2 parameters:

/// 1) it's the selected date (can be null if the selected date is outside the allowed range)
/// 2) is the action of the confirm button (the user selected the date)

extension AndesDatePicker: AndesDatePickerAbstractViewDelegate {
    func didSelectDate(_ date: Date?, _ isConfirmed: Bool) {
        didTapped?(date, isConfirmed)
    }
}
