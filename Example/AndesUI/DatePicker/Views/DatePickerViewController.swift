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

        var dayComponent = DateComponents()
        dayComponent.day = 7
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: Date())

//        datePickerView.setDatePickerDate(maxDate: nextDate) { (selectedDate, isConfirmed) in
//            print("callback: -")
//            print(selectedDate)
//            print(isConfirmed)
//        }

        datePickerView.setDatePickerDate { selectedDate, isConfirmed  in
            print(selectedDate)
            print(isConfirmed)
        }
    }
}
