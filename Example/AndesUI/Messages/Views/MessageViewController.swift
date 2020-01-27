//
//  MessageViewController.swift
//  AndesUI_Example
//
//  Created by Nicolas Rostan Talasimov on 1/14/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI
class MessageViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: AndesMessage!
    @IBOutlet weak var randomText: AndesButton!
    @IBOutlet weak var randomTitle: AndesButton!
    @IBOutlet weak var animateButton: AndesButton!
    @IBOutlet weak var hierarchyField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    var typePicker: UIPickerView = UIPickerView()
    var statePicker: UIPickerView = UIPickerView()
    let messageDict = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        "Single line",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    ]

    let titleDict = ["Title", "Two Words", "One, Two, Three, Four...", "Super long title to see if title can be multiline or not, can it?"]

    fileprivate func setupButtons() {
        randomText.setText("Random Description")
        randomTitle.setText("Random Title")
        animateButton.setText("Animate")

        randomText.setSize(.small)
        randomTitle.setSize(.small)
        animateButton.setSize(.small)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        createPickerViews()
        messageView.onDismiss({[unowned self] message in self.isDismissing(message)})
        messageView.setDismissable(true)
    }

    func isDismissing(_ message: AndesMessage) {
        let alert = UIAlertController(title: "Dismiss", message: "message dismiss pressed", preferredStyle: .alert)
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

    @IBAction func randomMessageAction(_ sender: Any) {
        let msg = messageDict.randomElement()
        self.contentView.subviews.filter {($0 is AndesMessage)}.forEach {
            if let message = $0 as? AndesMessage {
                message.setBody(msg!)
            }
        }
    }

    @IBAction func randomTitle(_ sender: Any) {
        let title = titleDict.randomElement()
        self.contentView.subviews.filter {($0 is AndesMessage)}.forEach {
            if let message = $0 as? AndesMessage {
                message.setTitle(title!)
            }
        }
    }

    @IBAction func animateChange(_ sender: Any) {
        let msg = messageDict.randomElement()
        let title = titleDict.randomElement()
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn], animations: {
            self.messageView.setBody(msg!)
            self.messageView.setTitle(title!)
            self.contentView.layoutIfNeeded()
        }, completion: nil)

    }
}

extension MessageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePicker {
           hierarchyField.resignFirstResponder()
            let hierarchy = AndesMessageHierarchy.init(rawValue: row)!
            hierarchyField.text = hierarchy.toString()
            messageView.setHierarchy(hierarchy)
        }
        if pickerView == statePicker {
            typeField.resignFirstResponder()
            let type = AndesMessageType.init(rawValue: row)!
            typeField.text = type.toString()
            messageView.setType(type)
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
        1
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
        case .highlight:
            return "Highlight"
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
