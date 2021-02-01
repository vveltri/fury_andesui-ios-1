//
//  AndesRadioButtonViewController.swift
//  AndesUI-demoapp
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

protocol RadioButtonView: NSObject {

}

class AndesRadioButtonViewController: UIViewController, RadioButtonView {
    @IBOutlet weak var typeText: UITextField!

    @IBOutlet weak var statusTxt: UITextField!
    @IBOutlet weak var alignTxt: UITextField!
    @IBOutlet weak var radioButtonTxt: UITextField!
    @IBOutlet weak var numberLinesTxt: UITextField!
    @IBOutlet weak var buttonBGColorTxt: UITextField!

    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!

    var typePicker: UIPickerView = UIPickerView()
    var statusPicker: UIPickerView = UIPickerView()
    var alignPicker: UIPickerView = UIPickerView()
    var bgcolorPicker: UIPickerView = UIPickerView()

    @IBOutlet weak var radioButton: AndesRadioButton!

    override func viewDidLoad() {

        radioButton.setRadioButtonTapped(callback: didTapIdle(radiobutton:))
        createPickerViews()
    }

    @IBAction func updateTapped(_ sender: Any) {
        self.radioButton.title = radioButtonTxt.text
        self.radioButton.titleNumberOfLines = 0

        if let text = numberLinesTxt.text, let numberLines = Int(text) {
            self.radioButton.titleNumberOfLines = numberLines
        }
    }

    @IBAction func clearTapped(_ sender: Any) {
        self.radioButton.title = "Andes RadioButton"
        self.radioButton.type = .idle
        self.radioButton.status = .unselected
        self.radioButton.align = .left
        self.radioButton.buttonBackgroundColor = .white

        typeText.text = self.radioButton.type.toString()
        statusTxt.text = self.radioButton.status.toString()
        alignTxt.text = self.radioButton.align.toString()
        buttonBGColorTxt.text = "Default"
        numberLinesTxt.text = "0"

        radioButtonTxt.text = ""
    }

    func createPickerViews() {
        typeText.inputView = typePicker
        typePicker.delegate = self
        typePicker.dataSource = self
        typeText.text = self.radioButton.type.toString()

        statusTxt.inputView = statusPicker
        statusPicker.delegate = self
        statusPicker.dataSource = self
        statusTxt.text = self.radioButton.status.toString()

        alignTxt.inputView = alignPicker
        alignPicker.delegate = self
        alignPicker.dataSource = self
        alignTxt.text = self.radioButton.align.toString()

        buttonBGColorTxt.inputView = bgcolorPicker
        bgcolorPicker.delegate = self
        bgcolorPicker.dataSource = self
        buttonBGColorTxt.text = "Default"
    }

    func didTapIdle(radiobutton: AndesRadioButton) {
        var alert: UIAlertController = UIAlertController()
        switch radiobutton.type {
        case .idle:
            if radiobutton.status == .unselected {
                alert = UIAlertController(title: "AndesUI Radiobutton", message: "RadioButton idle unselected pressed", preferredStyle: .alert)
            } else {
                alert = UIAlertController(title: "AndesUI Radiobutton", message: "RadioButton idle selected pressed", preferredStyle: .alert)
            }
        case .disabled:
            return
        case .error:
            alert = UIAlertController(title: "AndesUI RadioButton", message: "RadioButton error pressed", preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

extension AndesRadioButtonViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePicker {
           typeText.resignFirstResponder()
            self.radioButton.type = AndesRadioButtonType.init(rawValue: row)!
            typeText.text = self.radioButton.type.toString()
        }
        if pickerView == statusPicker {
            statusTxt.resignFirstResponder()
            self.radioButton.status = AndesRadioButtonStatus.init(rawValue: row)!
            statusTxt.text = self.radioButton.status.toString()

        }
        if pickerView == alignPicker {
            alignTxt.resignFirstResponder()
            self.radioButton.align = AndesRadioButtonAlign.init(rawValue: row)!
            alignTxt.text = self.radioButton.align.toString()
        }
        if pickerView == bgcolorPicker {
            buttonBGColorTxt.resignFirstResponder()
            if row == 0 {
                self.radioButton.buttonBackgroundColor = .white
                buttonBGColorTxt.text = "Default"
            }
            if row == 1 {
                self.radioButton.buttonBackgroundColor = .yellow
                buttonBGColorTxt.text = "Yellow"
            }
            if row == 2 {
                self.radioButton.buttonBackgroundColor = .blue
                buttonBGColorTxt.text = "Blue"
            }
            if row == 3 {
                self.radioButton.buttonBackgroundColor = .clear
                buttonBGColorTxt.text = "Clear"
            }
        }
    }
}

extension AndesRadioButtonViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typePicker {
            return 3
        }
        if pickerView == statusPicker {
            return 2
        }
        if pickerView == alignPicker {
            return 2
        }
        if pickerView == bgcolorPicker {
            return 4
        }
        return 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView == typePicker {
            let type = AndesRadioButtonType.init(rawValue: row)!
            return type.toString()
        }
        if pickerView == statusPicker {
             let status = AndesRadioButtonStatus.init(rawValue: row)!
            return status.toString()
        }
        if pickerView == alignPicker {
             let align = AndesRadioButtonAlign.init(rawValue: row)!
            return align.toString()
        }
        if pickerView == bgcolorPicker {
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
