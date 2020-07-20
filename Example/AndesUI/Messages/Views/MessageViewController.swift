//
//  MessageViewController.swift
//  AndesUI_Example
//
//  Created by Nicolas Rostan Talasimov on 1/14/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation
import AndesUI

protocol MessageView: NSObject {

}

class MessageViewController: UIViewController, MessageView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: AndesMessage!
    @IBOutlet weak var hierarchyField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var configView: UIView!
    @IBOutlet weak var configToggleButton: AndesButton!
    @IBOutlet weak var updateConfig: AndesButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var primaryActionTextField: UITextField!
    @IBOutlet weak var secondaryActionTextField: UITextField!
    @IBOutlet weak var linkActionTextField: UITextField!
    @IBOutlet weak var dismissibleSwitch: UISwitch!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var showAgainBtn: AndesButton!

    var typePicker: UIPickerView = UIPickerView()
    var statePicker: UIPickerView = UIPickerView()
    var type: AndesMessageType = .neutral
    var hierarchy: AndesMessageHierarchy = .loud

    fileprivate func setupButtons() {
        configToggleButton.text = "message.button.changeConfig".localized
        configToggleButton.hierarchy = .quiet
        configToggleButton.size = .medium

        updateConfig.text = "message.button.updateConfig".localized
        updateConfig.hierarchy = .loud
        updateConfig.size = .large

        showAgainBtn.text = "message.button.showAgain".localized
        showAgainBtn.hierarchy = .transparent
        showAgainBtn.size = .small
    }

    fileprivate func setupCnfigView() {
        configView.isHidden = true
        [titleTextField,
         secondaryActionTextField,
         primaryActionTextField,
         linkActionTextField,
         descTextView].forEach({
            $0!.layer.borderColor = UIColor.lightGray.cgColor
            $0!.layer.borderWidth = 1
         })
    }

    fileprivate func setupBaseMessage() {
        messageView.title = "message.default.title".localized
        messageView.body = "message.default.body".localized
        messageView.onDismiss {[unowned self] _ in
                self.showAgainBtn.isHidden = false
            }
        messageView.setPrimaryAction("Primary", handler: {[unowned self] _ in self.didPressButton()})
        messageView.setSecondaryAction("Secondary", handler: {[unowned self] _ in self.didPressButton()})
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupCnfigView()
        createPickerViews()

        setupBaseMessage()
    }

    func didPressButton() {
        let alert = UIAlertController(title: "message.actions.pressedMsg".localized, message: "", preferredStyle: .alert)
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

    @IBAction func showConfigTapped(_ sender: Any) {
        if !self.configView.isHidden {
            self.configToggleButton.text = "message.button.changeConfig".localized
            self.configToggleButton.hierarchy = .quiet

        } else {
            self.configToggleButton.text = "message.button.hideConfig".localized
            self.configToggleButton.hierarchy = .transparent

            self.titleTextField.text = messageView.title
            self.descTextView.text = messageView.body
            self.primaryActionTextField.text = messageView.primaryActionText
            self.secondaryActionTextField.text = messageView.secondaryActionText
            self.linkActionTextField.text = messageView.linkActionText
        }

        UIView.transition(with: configView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.configView.isHidden = !self.configView.isHidden

        }, completion: { _ in

            if self.configView.isHidden {
                self.scrollView.setContentOffset(.zero, animated: true)
            } else {
                self.scrollView.scrollRectToVisible(self.configView.frame, animated: true)
            }
        })
    }

    func validate(body: String, primary: String, secondary: String, link: String) -> String? {
        guard !body.isEmpty else {
            return "message.error.emptyBody".localized
        }
        guard secondary.isEmpty || !primary.isEmpty else {
            return "message.error.primaryNotSet".localized
        }
        guard link.isEmpty || primary.isEmpty else {
            return "message.error.linkAndActionsCoexistance".localized
        }
        return nil
    }

    @IBAction func showMsg(_ sender: Any) {
        messageView.isHidden = false
        showAgainBtn.isHidden = true
    }

    @IBAction func updateTapped(_ sender: Any) {
        let dismiss = dismissibleSwitch.isOn
        let title = titleTextField.text!
        let body = descTextView.text!
        let primary = primaryActionTextField.text!
        let secondary = secondaryActionTextField.text!
        let link = linkActionTextField.text!
        if let err = validate(body: body, primary: primary, secondary: secondary, link: link) {
            errorLabel.text = err
            errorLabel.isHidden = false
            return
        }

        errorLabel.isHidden = true

        messageView.isHidden = false
        messageView.title = title
        messageView.body = body
        messageView.isDismissable = dismiss
        messageView.type = type
        messageView.hierarchy = hierarchy
        messageView.setPrimaryAction(primary, handler: {[unowned self] _ in self.didPressButton()})
        messageView.setSecondaryAction(secondary, handler: {[unowned self] _ in self.didPressButton()})
        messageView.setLinkAction(link, handler: {[unowned self] _ in self.didPressButton()})
        showConfigTapped(sender)
    }
}

extension MessageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePicker {
           hierarchyField.resignFirstResponder()
            self.hierarchy = AndesMessageHierarchy.init(rawValue: row)!
            hierarchyField.text = hierarchy.toString()
        }
        if pickerView == statePicker {
            typeField.resignFirstResponder()
            self.type = AndesMessageType.init(rawValue: row)!
            typeField.text = type.toString()

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
