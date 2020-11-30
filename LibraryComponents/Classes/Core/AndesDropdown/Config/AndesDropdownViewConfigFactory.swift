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
        switch triggerType.type {
        case .formDropdown:
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           placeholderText: (dropdown.triggerType as? FormDropdownTrigger)?.placeholder,
                                           icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                           title: triggerType.title)
        case .standalone:
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                           title: triggerType.title)
        }
    }
}
