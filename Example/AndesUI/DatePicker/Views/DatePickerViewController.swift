//
//  DatePickerViewController.swift
//  AndesUI-demoapp
//
//  Created by Ândriu Felipe Coelho on 14/11/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class DatePickerViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet weak var datePickerView: AndesDatePicker!

    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
    }

    func setupDatePicker() {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(abbreviation: "UTC")!

        guard let dueDate = calendar.date(from: DateComponents(year: 2020, month: 11, day: 20)) else { return }

        guard let currentDate = calendar.date(from: DateComponents(year: 2020, month: 11, day: 15)) else { return }

//        datePickerView.setDatePickerDate(minDate: currentDate, maxDate: dueDate) { selectedDate in
//            print(selectedDate)
//        }

        datePickerView.setDatePickerDate { selectedDate in
            print(selectedDate)
        }
    }
}
