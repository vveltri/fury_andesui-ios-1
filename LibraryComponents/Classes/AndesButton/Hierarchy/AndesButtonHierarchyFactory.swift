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
class AndesButtonHierarchyFactory {

    private var styles: Dictionary<AndesButtonHierarchy, AndesButtonHierarchyProtocol>

    init() {
        styles = Dictionary<AndesButtonHierarchy, AndesButtonHierarchyProtocol>()
        styles[.loud] = AndesButtonHierarchyLoud()
        styles[.quiet] = AndesButtonHierarchyQuiet()
        styles[.transparent] = AndesButtonHierarchyTransparent()
    }

    func provideStyle(key: AndesButtonHierarchy) -> AndesButtonHierarchyProtocol {
        guard let style = styles[key] else {
            return AndesButtonHierarchyLoud()
        }
        return style
    }

}
