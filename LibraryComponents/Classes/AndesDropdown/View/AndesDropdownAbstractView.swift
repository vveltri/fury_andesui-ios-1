//
//  AndesDropdownAbstractView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownAbstractView: UIView, AndesDropdownView {

    @IBOutlet var view: UIView!
    @IBOutlet var textField: AndesTextField!

    var config: AndesDropdownViewConfig?
    weak var delegate: AndesDropdownViewDelegate?
    var text: String {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }

    init(withConfig config: AndesDropdownViewConfig) {
        super.init(frame: .zero)
        setup()
        updateView()
        self.textField.delegate = self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesDropdownViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(view)
        view.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        self.backgroundColor = .clear
        self.clipsToBounds = true
    }

    internal func updateView() {
        fatalError("This should be overriden by a subclass")
    }
}

extension AndesDropdownAbstractView: AndesTextFieldDelegate {
    func andesTextFieldShouldBeginEditing(_ textField: AndesTextField) -> Bool {
        delegate?.didSelectAndesTextField()
        return false
    }
}
