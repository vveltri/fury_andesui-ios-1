//
//  AndesTextFieldCode.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

@objc public class AndesTextFieldCode: UIView {

    var contentView: AndesTextFieldCodeView!

    /// Text for the label of the AndesTextFieldCode.
    @objc public var label: String? {
        didSet {
            updateContentView()
        }
    }

    /// Text for the helpLabel of the AndesTextFieldCode.
    @objc public var helpLabel: String? {
        didSet {
            updateContentView()
        }
    }

    /// The style of an AndesTextFieldCode defines the amount of input boxes and how they are grouped.
    @objc public var style: AndesTextFieldCodeStyle = .THREESOME {
        didSet {
            updateContentView(oldStyle: oldValue)
        }
    }

    /// The state of an AndesTextFieldCode defines its behaviours and colours.
    @objc public var state: AndesTextFieldCodeState = .IDLE {
        didSet {
            updateContentView()
        }
    }

    /// The text of an AndesTextFieldCode defines the whole text entered taken from all input boxes.
    @IBInspectable public var text: String {
        get { return contentView.text }
        set { setText(newValue: newValue) }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(label: String?, helpLabel: String?, style: AndesTextFieldCodeStyle, state: AndesTextFieldCodeState) {
        self.label = label
        self.helpLabel = helpLabel
        self.style = style
        self.state = state
        super.init(frame: .zero)
        setup()
    }
}

// MARK: Privates
private extension AndesTextFieldCode {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        drawContentView(with: provideView())
    }

    func drawContentView(with newView: AndesTextFieldCodeAbstractView) {
        contentView = newView
        if let contentView = contentView {
            addSubview(contentView)
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                topAnchor.constraint(equalTo: contentView.topAnchor),
                bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
    }

    /// Should return a view depending on which AndesTextfieldCode variant is selected.
    func provideView() -> AndesTextFieldCodeAbstractView {
        let config = AndesTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        switch config.style {
        case .THREESOME:
            return AndesTextFieldCodeThreesome(config: config)
        case .FOURSOME:
            return AndesTextFieldCodeFoursome(config: config)
        case .THREE_BY_THREE:
            return AndesTextFieldCodeThreeByThree(config: config)
        }
    }

    func updateContentView() {
        let config = AndesTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        contentView?.update(withConfig: config)
    }

    func updateContentView(oldStyle: AndesTextFieldCodeStyle) {
        if oldStyle != style {
            reDrawContentViewIfNeededThenUpdate()
        } else {
            let config = AndesTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
            contentView?.update(withConfig: config)
        }
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered.
    func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            let oldText = contentView.text
            contentView.removeFromSuperview()
            drawContentView(with: newView)
            if !oldText.isEmpty {
                setText(newValue: oldText)
            }
        }
        updateContentView()
    }

    func setText(newValue: String) {
        if let contentView = contentView as? AndesTextFieldCodeAbstractView {
            contentView.setText(newValue: newValue)
        }
    }
}
