//
//  RightComponentProtocol.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/23/20.
//

import UIKit

@objc public enum AndesTextFieldComponentVisibility: Int, AndesEnumStringConvertible {
    static var keys: [String] = ["ALWAYS", "WHILE_EDITING", "WHILE_IDLE", "WHILE_NOT_EMPTY"]

    case always
    case whileEditting
    case whileIdle
    case whileNotEmpty
}

@objc public protocol AndesTextFieldRightComponent {
    var visibility: AndesTextFieldComponentVisibility { get }
}

@objc public protocol AndesTextFieldLeftComponent {
    var visibility: AndesTextFieldComponentVisibility { get }
}

internal class AndesTextFieldComponentFactory {

    static func generateLeftComponentView(for component: AndesTextFieldLeftComponent, in view: AndesTextFieldView) -> UIView? {
        if let cmpt = (component as? AndesTextFieldComponentLabel) {
            return generateCenteredLabel(text: cmpt.text, style: view.config.placeholderStyle, insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 8))
        } else if let component = component as? AndesTextFieldComponentIcon {
            return generateCenteredImage(icon: component.icon, tintColor: component.tintColor, insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
        }
        return nil
    }

    static func generateRightComponentView(for component: AndesTextFieldRightComponent, in view: AndesTextFieldView) -> UIView? {
        if let component = component as? AndesTextFieldComponentLabel {
            return generateCenteredLabel(text: component.text, style: view.config.placeholderStyle, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
        } else if let component = component as? AndesTextFieldComponentIcon {
            return generateCenteredImage(icon: component.icon, tintColor: component.tintColor, insets: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
        } else if let component = component as? AndesTextFieldComponentClear {
            return AndesTextFieldClearView(iconColor: component.iconColor, iconName: component.clearIcon) { [weak view] in
               view?.clear()
           }
        }
        return nil
    }

    private static func generateCenteredLabel(text: String, style: AndesFontStyle, insets: UIEdgeInsets) -> UIView {
        let container = UIView()
        let label = UILabel()
        label.text = text
        label.setAndesStyle(style: style)
        container.addSubview(label)
        label.pinToSuperview(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
        label.sizeToFit()
        return container
    }

    private static func generateCenteredImage(icon: UIImage, tintColor: UIColor, insets: UIEdgeInsets) -> UIView {
        let container = UIView()
        let imageView = UIImageView(image: icon)
        container.addSubview(imageView)
        imageView.tintColor = tintColor
        imageView.pinToSuperview(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
        imageView.sizeToFit()
        return container
    }
}

private class AndesTextFieldClearView: UIView {
    private var clearHandler: (() -> Void)?
    private var iconColor: UIColor?
    private var iconName: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(iconColor: UIColor, iconName: String, clearHandler: @escaping () -> Void) {
        self.init()

        self.iconColor = iconColor
        self.iconName = iconName
        self.clearHandler = clearHandler
        setUp()
    }

    func setUp() {
        guard let iconName = self.iconName, let iconColor = self.iconColor else {
            return
        }

        let btn = UIButton()
        AndesIconsProvider.loadIcon(name: iconName) {
            btn.setImage($0, for: .normal)
        }

        btn.tintColor = iconColor
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(self.executeCallback), for: .touchUpInside)
        btn.pinToSuperview(top: 0, left: 8, bottom: 0, right: 8)
    }

    @objc func executeCallback() {
        clearHandler?()
    }
}

@objc public class AndesTextFieldComponentLabel: NSObject, AndesTextFieldLeftComponent, AndesTextFieldRightComponent {
    public var visibility: AndesTextFieldComponentVisibility = .always

    public let text: String

    public init(text: String) {
        self.text = text
        super.init()
    }
}

@objc public class AndesTextFieldComponentClear: NSObject, AndesTextFieldRightComponent {
    public var visibility: AndesTextFieldComponentVisibility = .whileEditting

    let clearIcon = "andes_ui_close_16"
    let iconColor = AndesStyleSheetManager.styleSheet.textColorSecondary
}

@objc public class AndesTextFieldComponentIcon: NSObject, AndesTextFieldRightComponent, AndesTextFieldLeftComponent {
    public var visibility: AndesTextFieldComponentVisibility = .always

    @objc public private(set) var icon: UIImage = UIImage()
    @objc public private(set) var tintColor: UIColor = .clear

    public convenience init(andesIconName: String, tintColor: UIColor) {
        self.init()
        AndesIconsProvider.loadIcon(name: andesIconName, success: { self.icon = $0 })
        self.tintColor = tintColor
    }

    public convenience init(icon: UIImage, tintColor: UIColor) {
        self.init()
        self.icon = icon
        self.tintColor = tintColor
    }

}
