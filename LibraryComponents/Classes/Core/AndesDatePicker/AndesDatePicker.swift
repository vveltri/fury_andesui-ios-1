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

    // MARK: - Initializer

    @objc public init(startDate: Date, endDate: Date) {
        contentView = AndesDatePickerDefaultView()
        self.startDate = startDate
        self.endDate = endDate
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        contentView = AndesDatePickerDefaultView()
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
