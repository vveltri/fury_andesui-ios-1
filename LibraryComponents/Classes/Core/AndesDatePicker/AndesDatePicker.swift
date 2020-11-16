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

    internal var didTapped: ((Date?) -> Void)?

    @objc public func setDatePickerDate(minDate: Date? = nil, maxDate: Date? = nil, callback: @escaping ((Date?) -> Void)) {
        self.didTapped = callback
        datePickerView.setDates(start: minDate, end: maxDate)
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

extension AndesDatePicker: AndesDatePickerAbstractViewDelegate {
    func didSelectDate(_ date: Date?) {
        didTapped?(date)
    }
}
