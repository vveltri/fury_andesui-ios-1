//
//  AndesDropdownConfigFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

internal class AndesDropdownViewConfigFactory {
    static func provide(from dropdown: AndesDropdown, isSelected: Bool) -> AndesDropdownViewConfig {

        let triggerType = dropdown.triggerType
        let style = AndesDropdownStyleFactory.getStyle(triggerType.type)
        let formTrigger = dropdown.triggerType as? FormDropdownTrigger
        let standaloneTrigger = dropdown.triggerType as? StandaloneDropdownTrigger

        switch triggerType.type {
        case .formDropdown:
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           placeholderText: formTrigger?.placeholder,
                                           icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                           title: formTrigger?.title,
                                           iconColor: UIColor.Andes.blueML500)
        case .standalone:
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                           size: standaloneTrigger?.size ?? .medium,
                                           iconColor: UIColor.Andes.gray450)
        }
    }
}
