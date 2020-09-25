//
//  AndesTextfieldCodeAbstractView.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

class AndesTextfieldCodeAbstractView: UIControl, AndesTextfieldCodeView {

    // MARK: Views
    @IBOutlet weak var andesCodeTextFieldView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var helperIconImageView: UIImageView!

    // MARK: Constraints
    @IBOutlet weak var helpLabelLeadingConstraint: NSLayoutConstraint!

    var text: String = ""
    internal var config: AndesTextFieldCodeViewConfig

    internal init(config: AndesTextFieldCodeViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesTextFieldCodeViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }
}

// MARK: Publics
extension AndesTextfieldCodeAbstractView {
    func update(withConfig config: AndesTextFieldCodeViewConfig) {
        self.config = config
        updateView()
    }

    func setText(newValue: String) {
        let newValueIsEmpty = newValue.isEmpty
        let numericCharacters = Array(newValue.filter { isDecimalNumber(String($0)) })
        let andesTextFieldsArray = stackView.arrangedSubviews.compactMap { $0 as? AndesTextField }
        if !numericCharacters.isEmpty || newValueIsEmpty {
            andesTextFieldsArray.forEach { $0.text = "" }
        }
        for (index, andesTextfield) in andesTextFieldsArray.enumerated() where index < numericCharacters.count {
            andesTextfield.text = String(numericCharacters[index])
        }
    }
}

// MARK: Privates
private extension AndesTextfieldCodeAbstractView {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .clear
        loadNib()
        pinXibViewToSelf()
        setupAndesTextFields()
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(andesCodeTextFieldView)
        andesCodeTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: andesCodeTextFieldView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: andesCodeTextFieldView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: andesCodeTextFieldView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: andesCodeTextFieldView.bottomAnchor).isActive = true
    }

    func setupAndesTextFields() {
        stackView.arrangedSubviews.forEach {
            if let andesTextField = $0 as? AndesTextField {
                andesTextField.delegate = self
                andesTextField.textInputTraits = .numberPad
            }
        }
    }

    func updateView() {
        updateIcon()
        updateLabel(text: config.labelText, label: label, style: config.labelStyle)
        updateLabel(text: config.helperText, label: helpLabel, style: config.helperStyle)
        updateState()
    }

    func updateIcon() {
        if let icon = config.helperIcon, !icon.isEmpty {
            helperIconImageView.isHidden = false
            AndesIconsProvider.loadIcon(name: icon, placeItInto: helperIconImageView)
            helperIconImageView.tintColor = config.helperIconTintColor
            helperIconImageView.backgroundColor = config.helperIconBgColor
            helpLabelLeadingConstraint.priority = .defaultLow
        } else {
            helperIconImageView.isHidden = true
            helpLabelLeadingConstraint.priority = .defaultHigh
        }
    }

    func updateLabel(text: String?, label: UILabel, style: AndesFontStyle) {
        guard let txt = text, !txt.isEmpty else {
            label.text = ""
            label.isHidden = true
            return
        }
        label.text = txt
        label.isHidden = false
        label.setAndesStyle(style: style)
    }

    func updateState() {
        stackView.arrangedSubviews.forEach {
            if let textField = $0 as? AndesTextField {
                switch config.state {
                case .IDLE:
                    textField.state = .idle
                case .ERROR:
                    textField.state = .error
                case .DISABLED:
                    textField.state = .disabled
                }
            }
        }
    }

    func updateText() {
        let andesTextFieldsArray = stackView.arrangedSubviews.compactMap { $0 as? AndesTextField }
        var newValue = ""
        andesTextFieldsArray.forEach {
            newValue.append($0.text)
        }
        text = newValue
    }

    func isDecimalNumber(_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    func updatedTextIsMinorOrEqualToOneDigit(currentText: String, range: NSRange, newString: String) -> Bool {
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: newString)
        return updatedText.count <= 1
    }
}

// MARK: AndesTextFieldDelegate
extension AndesTextfieldCodeAbstractView: AndesTextFieldDelegate {
    func andesTextField(_ textField: AndesTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return isDecimalNumber(string) && updatedTextIsMinorOrEqualToOneDigit(currentText: textField.text, range: range, newString: string)
    }

    func andesTextFieldDidChange(_ textField: AndesTextField) {
        updateText()
    }
}
