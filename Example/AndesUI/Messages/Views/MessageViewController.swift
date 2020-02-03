//
//  MessageViewController.swift
//  AndesUI_Example
//
//  Created by Nicolas Rostan Talasimov on 1/14/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation
import AndesUI
class MessageViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: AndesMessage!
    @IBOutlet weak var messageWithActions: AndesMessage!
    @IBOutlet weak var randomText: AndesButton!
    @IBOutlet weak var randomTitle: AndesButton!
    @IBOutlet weak var showHidden: AndesButton!
    @IBOutlet weak var hierarchyField: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var typeField: UITextField!

    var typePicker: UIPickerView = UIPickerView()
    var statePicker: UIPickerView = UIPickerView()
    let messageDict: [String] = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        "Single line",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    ]

    let titleDict: [String] = ["", "Title", "Two Words", "One, Two, Three, Four...", "Super long title to see if title can be multiline or not, can it?"]

    fileprivate func setupButtons() {
        randomText.setText("Random Description")
        randomTitle.setText("Random Title")
        showHidden.setText("Show hidden")

        randomText.setSize(.small)
        randomTitle.setSize(.small)
        showHidden.setSize(.small)

        showHidden.setHierarchy(.transparent)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        createPickerViews()

        messageWithActions.setPrimaryAction("Primary", handler: {[unowned self] _ in self.didPressButton()})
        messageWithActions.setSecondaryAction("Secondary", handler: {[unowned self] _ in self.didPressButton()})
    }

    func didPressButton() {
        let alert = UIAlertController(title: "Button Pressed", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func createPickerViews() {
        hierarchyField.inputView = typePicker
        typePicker.delegate = self
        typePicker.dataSource = self

        typeField.inputView = statePicker
        statePicker.delegate = self
        statePicker.dataSource = self
    }

    func modifiyMessages<T>(param: T, modifier: (AndesMessage) -> (T) -> AndesMessage) {
        self.stackView.subviews.filter {($0 is AndesMessage)}.forEach {
            if let message = $0 as? AndesMessage {
                _ = modifier(message)(param)
            }
        }
    }

    @IBAction func dismissableDidChange(_ sender: UISwitch) {
        modifiyMessages(param: sender.isOn, modifier: AndesMessage.setDismissable)
    }

    @IBAction func randomMessageAction(_ sender: Any) {
        let msg: String = messageDict.randomElement()!
        modifiyMessages(param: msg, modifier: AndesMessage.setBody)
    }

    @IBAction func showHidden(_ sender: Any) {
        self.stackView.subviews.filter {($0 is AndesMessage)}.forEach {
            if let message = $0 as? AndesMessage {
                message.isHidden = false
            }
        }
    }

    @IBAction func randomTitle(_ sender: Any) {
        let title: String? = titleDict.randomElement()
        modifiyMessages(param: title, modifier: AndesMessage.setTitle)
    }
}

extension MessageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePicker {
           hierarchyField.resignFirstResponder()
            let hierarchy = AndesMessageHierarchy.init(rawValue: row)!
            hierarchyField.text = hierarchy.toString()
            modifiyMessages(param: hierarchy, modifier: AndesMessage.setHierarchy)
        }
        if pickerView == statePicker {
            typeField.resignFirstResponder()
            let type = AndesMessageType.init(rawValue: row)!
            typeField.text = type.toString()
            modifiyMessages(param: type, modifier: AndesMessage.setType)
          }
    }
}

extension MessageViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typePicker {
            return 2
        }
        if pickerView == statePicker {
            return 4
        }
        return 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView == typePicker {
            let type = AndesMessageHierarchy.init(rawValue: row)!
            return type.toString()
        }
        if pickerView == statePicker {
             let state = AndesMessageType.init(rawValue: row)!
            return state.toString()
        }
        return ""
    }
}

extension AndesMessageType {
    func toString() -> String {
        switch self {
        case .neutral:
            return "Neutral"
        case .success:
            return "Success"
        case .error:
            return "Error"
        case .warning:
            return "Warning"
        }
    }
}

extension AndesMessageHierarchy {
    func toString() -> String {
        switch self {
        case .loud:
            return "Loud"
        case .quiet:
            return "Quiet"
        }
    }
}
