//
//  AndesDayDatePicker.swift
//  AndesUI
//
//  Created by Ândriu Felipe Coelho on 10/11/20.
//

import Foundation

struct AndesDayDatePicker {

    // MARK: - Attributes

    private(set) var date: Date
    private(set) var number: String
    private(set) var selected: Bool
    private(set) var isCurrentMonth: Bool

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }()

    init(date: Date = Date(), number: String = "", selected: Bool = false, isCurrentMonth: Bool = false) {
        self.date = date
        self.number = number
        self.selected = selected
        self.isCurrentMonth = isCurrentMonth
    }

    // MARK: - Struct methods

    mutating func getDaysInMonth(_ date: Date, selectedDate: Date) -> [AndesDayDatePicker] {
        guard let monthData = try? AndesMonthDatePicker.getMonthData(date) else {
            fatalError("error to load the month in date: \(date)")
        }

        let daysNumberInMonth = monthData.daysNumber
        let offsetToInitialRow = monthData.firstWeekday
        let firstDay = monthData.firstDay

        var days: [AndesDayDatePicker] = (1..<(daysNumberInMonth + offsetToInitialRow)).map { day in
            let isCurrentMonth = day >= offsetToInitialRow
            let dayOffSet = isCurrentMonth ? day - offsetToInitialRow : -(offsetToInitialRow - day)

            let calendar = Calendar(identifier: .gregorian)
            let date = calendar.date(byAdding: .day, value: dayOffSet, to: firstDay) ?? firstDay

            return AndesDayDatePicker(date: date, number: dateFormatter.string(from: date), selected: calendar.isDate(date, inSameDayAs: selectedDate), isCurrentMonth: isCurrentMonth)
        }

        days += generateStartOfNextMonth(using: firstDay, selectedDate: selectedDate)

        return days
    }

    mutating func generateStartOfNextMonth(using firstDayOfDisplayedMonth: Date, selectedDate: Date) -> [AndesDayDatePicker] {

        let calendar = Calendar(identifier: .gregorian)
        guard let lastDayInMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1),
                                                 to: firstDayOfDisplayedMonth) else { return [] }

        let additionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth) + 1

        guard additionalDays > 0 else {
            return []
        }
        let days: [AndesDayDatePicker] = (1...additionalDays)
            .map {
                let date = calendar.date(byAdding: .day, value: $0, to: lastDayInMonth) ?? lastDayInMonth

                return AndesDayDatePicker(date: date,
                                        number: dateFormatter.string(from: date),
                                        selected: calendar.isDate(date, inSameDayAs: selectedDate),
                                        isCurrentMonth: false)
            }

        return days
    }
}
