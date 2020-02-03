//
//  AndesButtonSizeFactory.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
//

import Foundation

/**
 The responsability of the factory is to provide the right size by providing the AndesButtonSize
 */
class AndesButtonSizeFactory {

    private var styles: [AndesButtonSize: AndesButtonSizeProtocol]

    init() {
        styles = [AndesButtonSize: AndesButtonSizeProtocol]()
        styles[.large] = AndesButtonSizeLarge()
        styles[.medium] = AndesButtonSizeMedium()
        styles[.small] = AndesButtonSizeSmall()
    }

    func provideStyle(key: AndesButtonSize, icon: AndesButtonIcon?) -> AndesButtonSizeProtocol {

        if key == .large {
            return AndesButtonSizeLarge(buttonIcon: icon)
        }

        guard let style = styles[key] else {
            return styles[.large]!
        }

        return style
    }
}
