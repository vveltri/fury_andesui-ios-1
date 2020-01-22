//
//  AndesButtonViewConfigFactory.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 22/01/2020.
//

import Foundation

/**
The responsability of the factory is to provide the ViewConfig from the user specified attributes
*/
internal class AndesButtonViewConfigFactory {
    func provide(hierarchy: AndesButtonHierarchy, size: AndesButtonSize, text: String, icon: AndesButtonIcon?) -> AndesButtonViewConfig {
        let buttonHierarchy = AndesButtonHierarchyFactory().provideStyle(key: hierarchy)
        let buttonSize = AndesButtonSizeFactory().provideStyle(key: size, icon: icon)

        let viewConfig = AndesButtonViewConfig(backgroundColor: buttonHierarchy.idleColor.cgColor, pressedColor: buttonHierarchy.pressedColor.cgColor, disableColor: buttonHierarchy.disableColor.cgColor, text: text, textColor: buttonHierarchy.fontColor, font: buttonSize.font, cornerRadius: buttonSize.borderRadius, height: buttonSize.height, padding: buttonSize.padding, icon: icon?.icon)

        return viewConfig
    }
}
