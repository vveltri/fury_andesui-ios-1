//
//  AndesCaheckbox.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation
import UIKit

@objc public class AndesCheckbox: UIView {
    internal var contentView: AndesCheckboxView!

    /// Sets the title of the AndesCheckbox
    @IBInspectable public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the type of the AndesCaheckbox , default idle
   @objc public var type: AndesCheckboxType = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the slign of the AndesCaheckbox , default left
    @objc public var align: AndesCheckboxAlign = .left {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the status of the AndesCaheckbox , default unselected
    @objc public var status: AndesCheckboxStatus = .unselected {
        didSet {
            self.updateContentView()
        }
    }

    /// Callback invoked when checkbox button is tapped
    internal var didTapped: ((AndesCheckbox) -> Void)?

    /// Set dismiss callback to be invoked when checkbox button is pressed
    @objc public func setCheckboxDidTapped(callback: @escaping ((AndesCheckbox) -> Void)) {
        self.didTapped = callback
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(type: AndesCheckboxType, align: AndesCheckboxAlign, status: AndesCheckboxStatus, title: String) {
        super.init(frame: .zero)
        self.title = title
        self.type = type
        self.align = align
        self.status = status
        setup()
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let config = AndesCheckboxViewConfig(for: self)
        contentView = AndesCheckboxDefaultView(withConfig: config)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        contentView.delegate = self

        //accesibility
        contentView.isAccessibilityElement = false
        self.isAccessibilityElement = true
        self.accessibilityTraits = .button
        self.accessibilityLabel = self.title
    }

    private func updateContentView() {
        let config = AndesCheckboxViewConfig(for: self)
        contentView.update(withConfig: config)
    }
}

extension AndesCheckbox: AndesCheckboxViewDelegate {
    func checkboxTapped() {
        guard let callback = self.didTapped else {
            return
        }
        switch self.type {
        case .error:
            //accesibility
            self.accessibilityTraits.remove(.selected)
            self.accessibilityTraits.remove(.notEnabled)

            self.type = .idle
            self.status = .selected
        case .idle:
            self.accessibilityTraits.remove(.notEnabled)
            if self.status == .selected {
                //accesibility
                self.accessibilityTraits.remove(.selected)
                self.status = .unselected
            } else if self.status == .unselected || self.status == .undefined {
                //accesibility
                self.accessibilityTraits.insert(.selected)
                self.status = .selected
            }
        case .disabled:
            //accesibility
            self.accessibilityTraits.insert(.notEnabled)
            //Never happend
            return
        }
        updateContentView()
        callback(self)
    }
}

// MARK: - IB interface
public extension AndesCheckbox {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = AndesCheckboxType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'status' instead.")
    @IBInspectable var ibStatus: String {
        set(val) {
            self.status = AndesCheckboxStatus.checkValidEnum(property: "IB status", key: val)
        }
        get {
            return self.status.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'align' instead.")
    @IBInspectable var ibAlign: String {
        set(val) {
            self.align = AndesCheckboxAlign.checkValidEnum(property: "IB align", key: val)
        }
        get {
            return self.align.toString()
        }
    }
}
