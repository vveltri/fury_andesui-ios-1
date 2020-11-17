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
    @IBOutlet weak var dateLabel: UILabel!

    // MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
    }

    func setupDatePicker() {
        datePickerView.setDatePickerDate { selectedDate, isConfirmed  in
            if isConfirmed {
                guard let date = selectedDate else { return }
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MMM/yyyy"
                self.dateLabel.text = dateFormatter.string(from: date)
            }
        }
    }
}
