//
//  AndesRadioButton.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/29/20.
//

import Foundation
import UIKit

@objc public class AndesRadioButton: UIView {
    internal var contentView: AndesRadioButtonView!

    /// Sets the title of the RadioButton
     @IBInspectable public var title: String? {
         didSet {
             self.updateContentView()
         }
     }

     /// Sets the type of the RadioButton , default idle
    @objc public var type: AndesRadioButtonType = .idle {
         didSet {
             self.updateContentView()
         }
     }

     /// Sets the slign of the RadioButton , default left
     @objc public var align: AndesRadioButtonAlign = .left {
         didSet {
             self.updateContentView()
         }
     }

     /// Sets the status of the RadioButton , default unselected
     @objc public var status: AndesRadioButtonStatus = .unselected {
         didSet {
             self.updateContentView()
         }
     }

     /// Callback invoked when RadioButton  is tapped
     internal var didTapped: ((AndesRadioButton) -> Void)?

    /// Set dismiss callback to be invoked when checkbox button is pressed
    @objc public func setRadioButtonTapped(callback: @escaping ((AndesRadioButton) -> Void)) {
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

    @objc public init(type: AndesRadioButtonType, align: AndesRadioButtonAlign, status: AndesRadioButtonStatus, title: String) {
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
        let config = AndesRadioButtonConfig(for: self)
        contentView = AndesRadioButtonDefaultView(withConfig: config)
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
        let config = AndesRadioButtonConfig(for: self)
        contentView.update(withConfig: config)
    }
}

extension AndesRadioButton: AndesRadioButtonViewDelegate {
    func buttonTapped() {
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
            } else if self.status == .unselected {
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
public extension AndesRadioButton {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = AndesRadioButtonType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'status' instead.")
    @IBInspectable var ibStatus: String {
        set(val) {
            self.status = AndesRadioButtonStatus.checkValidEnum(property: "IB status", key: val)
        }
        get {
            return self.status.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'align' instead.")
    @IBInspectable var ibAlign: String {
        set(val) {
            self.align = AndesRadioButtonAlign.checkValidEnum(property: "IB align", key: val)
        }
        get {
            return self.align.toString()
        }
    }
}
