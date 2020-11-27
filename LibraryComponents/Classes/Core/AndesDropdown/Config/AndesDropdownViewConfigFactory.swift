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
        if let style = AndesDropdownStyleFactory.getStyle(triggerType.type) {
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                           title: triggerType.title)
        }
        return AndesDropdownViewConfig(borderColor: UIColor.Andes.gray250,
                                       placeholderText: (dropdown.triggerType as? FormDropdownCell)?.placeholder,
                                       icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                       title: triggerType.title)
    }
}
