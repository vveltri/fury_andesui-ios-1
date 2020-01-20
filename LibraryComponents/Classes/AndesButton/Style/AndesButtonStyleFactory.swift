//
//  AndesButtonStyleFactory.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 02/01/2020.
//

import Foundation

/**
The responsability of the factory is to provide the right style by providing the AndesButtonSize
*/
class AndesButtonStyleFactory {

    private var styles: Dictionary<AndesButtonStyle, AndesButtonStyleProtocol>

    init() {
        styles = Dictionary<AndesButtonStyle, AndesButtonStyleProtocol>()
        styles[.loud] = AndesButtonStyleLoud()
        styles[.quiet] = AndesButtonStyleQuiet()
        styles[.transparent] = AndesButtonStyleTransparent()
    }

    func provideStyle(key: AndesButtonStyle) -> AndesButtonStyleProtocol {
        guard let style = styles[key] else {
            return AndesButtonStyleLoud()
        }
        return style
    }

}
