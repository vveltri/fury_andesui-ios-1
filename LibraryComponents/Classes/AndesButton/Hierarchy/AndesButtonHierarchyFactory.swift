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

    private var hierarchies: Dictionary<AndesButtonHierarchy, AndesButtonHierarchyProtocol>

    init() {
        hierarchies = Dictionary<AndesButtonHierarchy, AndesButtonHierarchyProtocol>()
        hierarchies[.loud] = AndesButtonHierarchyLoud()
        hierarchies[.quiet] = AndesButtonHierarchyQuiet()
        hierarchies[.transparent] = AndesButtonHierarchyTransparent()
    }

    func provideStyle(key: AndesButtonHierarchy) -> AndesButtonHierarchyProtocol {
        guard let hierarchy = hierarchies[key] else {
            return AndesButtonHierarchyLoud()
        }
        return hierarchy
    }

}
