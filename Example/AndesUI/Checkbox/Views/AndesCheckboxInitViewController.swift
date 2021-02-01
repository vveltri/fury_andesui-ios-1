//
//  AndesCheckboxInitViewController.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/24/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class AndesCheckboxInitViewController: UIViewController {

    var typePicker: UIPickerView = UIPickerView()
    var statusPicker: UIPickerView = UIPickerView()
    var alignPicker: UIPickerView = UIPickerView()
    var bgcolorPicker: UIPickerView = UIPickerView()
    var fillColorPicker: UIPickerView = UIPickerView()

    @IBOutlet weak var andesCheckbox: AndesCheckbox!
    @IBOutlet weak var typeTxt: UITextField!
    @IBOutlet weak var statusTxt: UITextField!
    @IBOutlet weak var alignTxt: UITextField!
    @IBOutlet weak var checkboxTxt: UITextField!
    @IBOutlet weak var buttonBGColorTxt: UITextField!
    @IBOutlet weak var fillColorTxt: UITextField!

    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    override func viewDidLoad() {
        self.andesCheckbox.setCheckboxDidTapped(callback: didTapIdle(checkbox:))
        createPickerViews()
    }

    func createPickerViews() {
        typeTxt.inputView = typePicker
        typePicker.delegate = self
        typePicker.dataSource = self
        typeTxt.text = self.andesCheckbox.type.toString()

        statusTxt.inputView = statusPicker
        statusPicker.delegate = self
        statusPicker.dataSource = self
        statusTxt.text = self.andesCheckbox.status.toString()

        alignTxt.inputView = alignPicker
        alignPicker.delegate = self
        alignPicker.dataSource = self
        alignTxt.text = self.andesCheckbox.align.toString()

        buttonBGColorTxt.inputView = bgcolorPicker
        bgcolorPicker.delegate = self
        bgcolorPicker.dataSource = self
        buttonBGColorTxt.text = "Default"

        fillColorTxt.inputView = fillColorPicker
        fillColorPicker.delegate = self
        fillColorPicker.dataSource = self
        fillColorTxt.text = "Default"
    }

    @IBAction func updateTapped(_ sender: Any) {
        andesCheckbox.title = checkboxTxt.text
    }

    @IBAction func clearTapped(_ sender: Any) {
        self.andesCheckbox.title = "Andes Checkbox"
        self.andesCheckbox.type = AndesCheckboxType.idle
        self.andesCheckbox.status = AndesCheckboxStatus.unselected
        self.andesCheckbox.align = AndesCheckboxAlign.left
        self.andesCheckbox.buttonBackgroundColor = .white
        self.andesCheckbox.selectedBackgroundColor = nil

        typeTxt.text = self.andesCheckbox.type.toString()
        statusTxt.text = self.andesCheckbox.status.toString()
        alignTxt.text = self.andesCheckbox.align.toString()
        buttonBGColorTxt.text = "Default"
        fillColorTxt.text = "Default"

        checkboxTxt.text = ""
    }

    func didTapIdle(checkbox: AndesCheckbox) {
        switch checkbox.type {
        case .idle:
            break
        case .disabled:
            break
        case .error:
            break
        }
    }
}

extension AndesCheckboxInitViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePicker {
           typeTxt.resignFirstResponder()
            self.andesCheckbox.type = AndesCheckboxType.init(rawValue: row)!
            typeTxt.text = self.andesCheckbox.type.toString()
        }
        if pickerView == statusPicker {
            statusTxt.resignFirstResponder()
            self.andesCheckbox.status = AndesCheckboxStatus.init(rawValue: row)!
            statusTxt.text = self.andesCheckbox.status.toString()

        }
        if pickerView == alignPicker {
            alignTxt.resignFirstResponder()
            self.andesCheckbox.align = AndesCheckboxAlign.init(rawValue: row)!
            alignTxt.text = self.andesCheckbox.align.toString()
        }
        if pickerView == bgcolorPicker {
            buttonBGColorTxt.resignFirstResponder()
            if row == 0 {
                self.andesCheckbox.buttonBackgroundColor = .white
                buttonBGColorTxt.text = "Default"
            }
            if row == 1 {
                self.andesCheckbox.buttonBackgroundColor = .yellow
                buttonBGColorTxt.text = "Yellow"
            }
            if row == 2 {
                self.andesCheckbox.buttonBackgroundColor = .blue
                buttonBGColorTxt.text = "Blue"
            }
            if row == 3 {
                self.andesCheckbox.buttonBackgroundColor = .clear
                buttonBGColorTxt.text = "Clear"
            }
        }
        if pickerView == fillColorPicker {
            fillColorTxt.resignFirstResponder()
            if row == 0 {
                self.andesCheckbox.selectedBackgroundColor = nil
                fillColorTxt.text = "Default"
            }
            if row == 1 {
                self.andesCheckbox.selectedBackgroundColor = .yellow
                fillColorTxt.text = "Yellow"
            }
            if row == 2 {
                self.andesCheckbox.selectedBackgroundColor = .blue
                fillColorTxt.text = "Blue"
            }
            if row == 3 {
                self.andesCheckbox.selectedBackgroundColor = .clear
                fillColorTxt.text = "Clear"
            }
        }
    }
}

extension AndesCheckboxInitViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typePicker {
            return 3
        }
        if pickerView == statusPicker {
            return 3
        }
        if pickerView == alignPicker {
            return 2
        }
        if pickerView == bgcolorPicker {
            return 4
        }
        if pickerView == fillColorPicker {
            return 4
        }
        return 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView == typePicker {
            let type = AndesCheckboxType.init(rawValue: row)!
            return type.toString()
        }
        if pickerView == statusPicker {
             let status = AndesCheckboxStatus.init(rawValue: row)!
            return status.toString()
        }
        if pickerView == alignPicker {
             let align = AndesCheckboxAlign.init(rawValue: row)!
            return align.toString()
        }
        if pickerView == bgcolorPicker || pickerView == fillColorPicker {
            switch row {
            case 0:
                return "Default"
            case 1:
                return "Yellow"
            case 2:
                return "Blue"
            case 3:
                return "Clear"
            default:
                return ""
            }
        }
        return ""
    }
}
