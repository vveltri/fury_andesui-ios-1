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
    @IBInspectable public var type: AndesCheckboxType = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the slign of the AndesCaheckbox , default left
    @IBInspectable public var align: AndesCheckboxAlign = .left {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the status of the AndesCaheckbox , default unselected
    @IBInspectable public var status: AndesCheckboxStatus = .unselected {
        didSet {
            self.updateContentView()
        }
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

    public func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let config = AndesCheckboxViewConfig(for: self)
        contentView = AndesCheckboxDefaultView(withConfig: config)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        //contentView.delegate = self
    }

    private func updateContentView() {
        let config = AndesCheckboxViewConfig(for: self)
        contentView.update(withConfig: config)
    }
}
