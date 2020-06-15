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

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public func setup() {
        contentView = AndesCheckboxDefaultView()
        self.addSubview(contentView)
        contentView.pinToSuperview()
        self.translatesAutoresizingMaskIntoConstraints = false
        //icon.layer.backgroundColor = UIColor.red.cgColor
    }
}
