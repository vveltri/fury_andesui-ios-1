//
//  AndesDropdownConfigFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

internal class AndesDropdownConfigFactory {
    static func provide(from dropdown: AndesDropdown) -> AndesDropdownViewConfig {

        if let style = AndesDropdownStyleFactory.getStyle(dropdown.triggerType) {
            return AndesDropdownViewConfig(borderColor: style.borderColor,
                                           labelText: dropdown.label,
                                           helperText: dropdown.helper,
                                           counter: dropdown.counter,
                                           placeholderText: dropdown.placeholder)
        }
        return AndesDropdownViewConfig(borderColor: UIColor.Andes.gray250,
                                       labelText: dropdown.label,
                                       helperText: dropdown.helper,
                                       counter: dropdown.counter,
                                       placeholderText: dropdown.placeholder)
    }
}
