//
//  AndesButton.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 03/12/2019.
//

import UIKit

/**
  User interface element the user can tap or click to perform an action.
  Has all the same features as an [UIButton] but reinforces the Andes style.
 
  Is compatible to use via code or via Interface Builder.
 
  The AndesButton has several custom atributes that allows you to specified the button look and feel.
  For style:
    - Loud
    - Quiet
    - Transparent
 
  For size:
    - Large (this is the only size that supports an icon)
    - Medium
    - Small
 
  The responsibility of the AndesButton is to know how it should be represent based on the attributes provided
 */
@objc public class AndesButton: UIControl {
    /// returns the current selected hierarchy
    public private(set) var hierarchy: AndesButtonHierarchy

    /// returns the current selected size
    public private(set) var size: AndesButtonSize

    /// returns the current text
    public private(set) var text: String

    /// returns the current selected hierarchy
    public private(set) var icon: AndesButtonIcon?

    internal var view: AndesButtonView
    private var config: AndesButtonViewConfig

    override public var isEnabled: Bool {
        didSet {
            if !isEnabled {
                view.disable()
            } else {
                view.enable()
            }
        }
    }

    /**
    Constructor for button when it is used programmatically where
     
    - Parameters:
         - text  is text that the button will contain
         - style is the type of button you want to draw
         - size is the especification for the button dimensions
         - icon (optional) allows to inyect an icon, only if the size specified is .large
     */
    @objc public init(text: String, hierarchy: AndesButtonHierarchy, size: AndesButtonSize, icon: AndesButtonIcon? = nil) {
        self.hierarchy = hierarchy
        self.size = size
        self.text = text
        self.icon = icon
        self.config = AndesButtonViewConfigFactory().provide(hierarchy: hierarchy, size: size, text: text, icon: icon)
        self.view = AndesButtonViewDefault(config: config)

        assert(!(size != .large && icon != nil), "Yo should not provide an icon if the size is not large")

        super.init(frame: .zero)

        setup()
    }

    /**
     Constructor for the button when it is used by interface builder
     By defect, it will be .loud and .large
     */
    required init?(coder: NSCoder) {
        self.hierarchy = .loud
        self.size = .large
        self.text = "Label"
        self.icon = nil
        self.config = AndesButtonViewConfigFactory().provide(hierarchy: hierarchy, size: size, text: text, icon: icon)
        self.view = AndesButtonViewDefault(config: config)

        super.init(coder: coder)

        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setupTargets()
        drawContentView()
        self.backgroundColor = .clear
        setText(text)
    }

    private func setupTargets() {
        addTarget(self, action: #selector(touchDown), for: .touchDragInside)
        addTarget(self, action: #selector(touchDown), for: .touchDown)

        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        addTarget(self, action: #selector(touchUp), for: .touchDragOutside)
    }

    private func drawContentView() {
        view = provideContentView()
        addSubview(view)

        view.isUserInteractionEnabled = false
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    private func provideContentView() -> AndesButtonView {
        guard let buttonIcon = self.icon else {
            return AndesButtonViewDefault(config: config)
        }

        if buttonIcon.orientation == .left {
            return AndesButtonViewIconLeft(config: config)
        } else {
            return AndesButtonViewIconRight(config: config)
        }
    }

    private func update() {
        view.removeFromSuperview()
        self.config = AndesButtonViewConfigFactory().provide(hierarchy: hierarchy, size: size, text: text, icon: icon)
        drawContentView()
    }

    /**
     Allows to change the text content of the button
     - Parameter title: is text that the button will contain
     */
    @objc @discardableResult public func setText(_ text: String) -> AndesButton {
        self.text = text
        view.setText(text)
        return self
    }

    /**
    Sets up the icon size to .large with the specified icon
    
    - Parameters:
       - icon the icon with its respective orientation
    */
    @objc @discardableResult public func setLargeSizeWithIcon(_ icon: AndesButtonIcon) -> AndesButton {
        self.size = .large
        self.icon = icon
        update()
        return self
    }

    /**
     Allows to specified a size of the button, these could be:
     * large
     * medium
     * small
     
     - Parameters:
        - sizeStyle is the new size of the button
     */
    @objc @discardableResult public func setSize(_ size: AndesButtonSize) -> AndesButton {
        self.icon = nil
        self.size = size
        update()
        return self
    }

    /**
     Allows to specified the style of the button, these could be
     * loud
     * quiet
     * transparent
     
     - Parameter style: is the new style of the button
     */
    @objc @discardableResult public func setHierarchy(_ hierarchy: AndesButtonHierarchy) -> AndesButton {
        self.hierarchy = hierarchy
        update()
        return self
    }

    /**
     UIControl method used when botton in touched up
     */
    @objc func touchUp() {
        view.touchUp()
    }

    /**
     UIControl method used when botton in touched down
    */
    @objc func touchDown() {
       view.touchDown()
    }

    internal func updateWithCustomConfig(_ config: AndesButtonViewConfig) {
        view.removeFromSuperview()
        self.config = config
        drawContentView()
    }
}
