//
//  TextFieldsCodeViewController.swift
//  AndesUI-demoapp
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation
import AndesUI

final class TextFieldsCodeViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var textFieldCodeTitle: UILabel!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var styleTextField: UITextField!
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var helpLabelTextField: UITextField!
    @IBOutlet weak var updateButton: AndesButton!

    var statePicker: UIPickerView = UIPickerView()
    var stylePicker: UIPickerView = UIPickerView()
    var state: AndesTextfieldCodeState = .IDLE
    var style: AndesTextfieldCodeStyle = .THREESOME
    var andesTextfieldCode: AndesTextfieldCode?

    override func viewDidLoad() {
        super.viewDidLoad()
        renderViews()
    }
}

// MARK: UI
private extension TextFieldsCodeViewController {
    func renderViews() {
        andesTextfieldCode = AndesTextfieldCode(label: nil, helpLabel: nil, style: .THREESOME, state: .IDLE)
        if let andesTextfieldCode = andesTextfieldCode {
            view.addSubview(andesTextfieldCode)
            NSLayoutConstraint.activate([
                andesTextfieldCode.topAnchor.constraint(equalTo: textFieldCodeTitle.bottomAnchor, constant: 24),
                andesTextfieldCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                andesTextfieldCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
            ])
        }
        createPickerViews()
    }

    func createPickerViews() {
        statePicker.delegate = self
        statePicker.dataSource = self
        stateTextField.inputView = statePicker
        stylePicker.delegate = self
        stylePicker.dataSource = self
        styleTextField.inputView = stylePicker
    }
}

// MARK: Actions
private extension TextFieldsCodeViewController {
    @IBAction func updateTapped(_ sender: Any) {
        andesTextfieldCode?.style = style
        andesTextfieldCode?.text = textTextField.text ?? ""
        andesTextfieldCode?.label = labelTextField.text
        andesTextfieldCode?.helpLabel = helpLabelTextField.text
        andesTextfieldCode?.state = state
    }

    @IBAction func clearTapped(_ sender: Any) {
        andesTextfieldCode?.text = ""
        andesTextfieldCode?.label = ""
        andesTextfieldCode?.helpLabel = ""
        andesTextfieldCode?.state = .IDLE
        andesTextfieldCode?.style = .THREESOME

        textTextField.text = ""
        labelTextField.text = ""
        helpLabelTextField.text = ""
        statePicker.selectRow(0, inComponent: 0, animated: true)
        pickerView(statePicker, didSelectRow: 0, inComponent: 0)
        stylePicker.selectRow(0, inComponent: 0, animated: true)
        pickerView(stylePicker, didSelectRow: 0, inComponent: 0)
    }
}

// MARK: UIPickerViewDelegate & UIPickerViewDataSource
extension TextFieldsCodeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == statePicker {
            stateTextField.resignFirstResponder()
            state = AndesTextfieldCodeState.init(rawValue: row)!
            stateTextField.text = state.toString()
        } else if pickerView == stylePicker {
            styleTextField.resignFirstResponder()
            style = AndesTextfieldCodeStyle.init(rawValue: row)!
            styleTextField.text = style.toString()
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == statePicker {
            return 3
        }
        if pickerView == stylePicker {
            return 3
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == statePicker {
            let state = AndesTextfieldCodeState.init(rawValue: row)!
            return state.toString()
        }
        if pickerView == stylePicker {
            let style = AndesTextfieldCodeStyle.init(rawValue: row)!
            return style.toString()
        }
        return ""
    }
}
