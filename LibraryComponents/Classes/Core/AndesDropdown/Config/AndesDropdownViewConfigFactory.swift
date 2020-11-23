//
//  AndesDropdownConfigFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

internal class AndesDropdownViewConfigFactory {
    static func provide(from dropdown: AndesDropdown, isSelected: Bool) -> AndesDropdownViewConfig {

        if let style = AndesDropdownStyleFactory.getStyle(dropdown.triggerType) {
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           counter: dropdown.counter,
                                           placeholderText: dropdown.placeholder,
                                           icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                           title: dropdown.title)
        }
        return AndesDropdownViewConfig(borderColor: UIColor.Andes.gray250,
                                       counter: dropdown.counter,
                                       placeholderText: dropdown.placeholder,
                                       icon: isSelected ? AndesIcons.chevronUp20 : AndesIcons.chevronDown20,
                                       title: dropdown.title)
    }
}
