//
//  AndesCheckboxViewConfig.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

/// used to define the ui of internal AndesCheckbox views
internal struct AndesCheckboxViewConfig {

    var title: String?
    var icon: String?
    var borderColor: UIColor?
    var textColor: UIColor!
    var iconColor: UIColor?
    var align: AndesCheckboxAlign! = AndesCheckboxAlign.left
    var backgroundColor: UIColor!
    var cornerRadius: CGFloat!
    var borderSize: CGFloat?
    var type: AndesCheckboxTypeProtocol! = AndesCheckboxTypeIdle()
    var status: AndesCheckboxStatusProtocol! = AndesCheckboxStatusUnselected()

    init() {

     }

    init(for checkbox: AndesCheckbox) {
        self.title = checkbox.title
        self.align = checkbox.align
        self.status = AndesCheckboxStatusFactory.provide(checkbox.status)
        self.icon = status.icon
        self.type = AndesCheckboxTypeFactory.provide(checkbox.type)
        self.textColor = type.textColor
        self.cornerRadius = type.cornerRadius
        self.iconColor = self.type.iconColor
        setupBackgroundAndBorderColor(for: checkbox)
    }

    //Set background based on checkbox status and type
    private mutating func setupBackgroundAndBorderColor(for checkbox: AndesCheckbox) {
        if checkbox.status == AndesCheckboxStatus.unselected {
            self.borderColor = type.borderColor
            self.borderSize = type.borderSize
        }

        switch checkbox.type {
        case .idle:
                self.backgroundColor = self.status.backgroundColor
        case .disabled:
            if checkbox.status == AndesCheckboxStatus.unselected {
                self.backgroundColor = self.status.backgroundColor
            } else {
                self.backgroundColor = self.type.backgroundColor
            }
        case .error:
            self.backgroundColor = self.type.backgroundColor
        }
    }

}
