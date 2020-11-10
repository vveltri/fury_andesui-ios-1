//
//  AndesDatePickerHeaderView.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 09/11/20.
//

import UIKit

class AndesDatePickerHeaderView: UICollectionReusableView {

    enum DaysOfWeek: Int {
        case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    }

    // MARK: - Attributes

    static let identifier = String(describing: AndesDatePickerHeaderView.self)

    private let weekDaysStackView: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center
        horizontalStack.distribution = .fillEqually
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false

        return horizontalStack
    }()

    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.Andes.gray800
        label.font = AndesStyleSheetManager.styleSheet.regularSystemFont(size: 16.0)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(weekDaysStackView)

        weekDaysStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        weekDaysStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        weekDaysStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

        addSubview(monthLabel)
        monthLabel.bottomAnchor.constraint(equalTo: weekDaysStackView.topAnchor, constant: 20).isActive = true
        monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        monthLabel.text = "Novembro 2020"

        populateDaysOfWeek()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func populateDaysOfWeek() {
        for day in 1...7 {
            let label = UILabel()
            label.text = getDayOfWeek(number: day)
            label.textAlignment = .center
            label.font = AndesStyleSheetManager.styleSheet.regularSystemFont(size: 10.0)
            label.textColor = UIColor.Andes.gray450
            label.isAccessibilityElement = false

            weekDaysStackView.addArrangedSubview(label)
        }
    }

    func getDayOfWeek(number: Int) -> String {
        switch DaysOfWeek(rawValue: number) {
        case .monday:
            return "MON"
        case .tuesday:
            return "TUE"
        case .wednesday:
            return "WED"
        case .thursday:
            return "THU"
        case .friday:
            return "FRI"
        case .saturday:
            return "SAT"
        case .sunday:
            return "SUN"
        default:
            return ""
        }
    }
}
