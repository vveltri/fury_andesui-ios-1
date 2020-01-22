//
//  AndesButtonAbstractView.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 AndesButtonAbstractView is an abstract class that includes the functionality for the button to be drawn by a AndesButtonSizeProtocol and a AndesButtonStyleProtocol
 */
internal class AndesButtonAbstractView: UIControl, AndesButtonView {

    internal var size: AndesButtonSizeProtocol
    internal var hierarchy: AndesButtonHierarchyProtocol
    internal var backgroundLayer: CALayer

    @IBOutlet var buttonView: UIView!
    @IBOutlet var label: UILabel!

    override public var frame: CGRect {
        didSet {
               buttonView?.frame = frame
           }
    }

    internal init(size: AndesButtonSizeProtocol, hierarchy: AndesButtonHierarchyProtocol) {
        self.size = size
        self.hierarchy = hierarchy
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        self.size = AndesButtonSizeLarge()
        self.hierarchy = AndesButtonHierarchyLoud()
        self.backgroundLayer = CALayer()
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        loadNib()

        backgroundLayer = buttonView.layer
        addSubview(buttonView)

        setupSize()
        setupStyle()
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    internal func setupStyle() {
        backgroundLayer.backgroundColor = hierarchy.idleColor.cgColor
        label.textColor = hierarchy.fontColor
    }

    internal func setupSize() {
        backgroundLayer.cornerRadius = size.borderRadius
        label.font = size.font
    }

    func enable() {
        setupStyle()
    }

    func disable() {
        backgroundLayer.backgroundColor = hierarchy.disableColor.cgColor
        label.textColor = AndesStyleSheetManager.styleSheet.textDisableColor
    }

    func touchUp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundLayer.backgroundColor = self.hierarchy.idleColor.cgColor
        }, completion: nil)
    }

    func touchDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundLayer.backgroundColor = self.hierarchy.pressedColor.cgColor
        }, completion: nil)
    }

    func setText(_ text: String) {
        let attributedString = NSMutableAttributedString.init(string: text)
        attributedString.addAttribute(.paragraphStyle, value: AndesButtonHelper.provideParagraphStyle(), range: NSRange(location: 0, length: text.count))
        label.attributedText = attributedString
    }
}

internal class AndesButtonHelper {

    public static func provideParagraphStyle() -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byTruncatingTail

        return paragraphStyle
    }
}
