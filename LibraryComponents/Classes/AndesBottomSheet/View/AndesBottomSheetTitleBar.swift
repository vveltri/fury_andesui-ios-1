//
//  AndesBottomSheetTitleBar.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import UIKit

private enum Constants {
    static let font = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: AndesFontSize.titleS)
    static let color = UIColor.Andes.gray800
    static let insets = UIEdgeInsets(top: 20, left: 24, bottom: 20, right: 24)
}

public class AndesBottomSheetTitleBar: UIView {

    var text: String? {
        get {
            return textLabel.text
        }
        set {
            textLabel.text = newValue
        }
    }

    var textAlignment: NSTextAlignment {
        get {
            return textLabel.textAlignment
        }
        set {
            textLabel.textAlignment = newValue
        }
    }

    private let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: AndesFontSize.titleS)
        textLabel.textColor = UIColor.Andes.gray800
        textLabel.numberOfLines = 1
        return textLabel
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        textLabel.pinToSuperview(top: Constants.insets.top,
                                 left: Constants.insets.left,
                                 bottom: Constants.insets.bottom,
                                 right: Constants.insets.right)
    }
}
