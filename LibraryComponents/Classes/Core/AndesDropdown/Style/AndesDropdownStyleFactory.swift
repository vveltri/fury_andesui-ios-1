//
//  AndesDropdownStyleFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownStyleFactory {

    static func getStyle(_ style: AndesDropdownTriggerType) -> AndesDropdownStyleProtocol? {
        switch style {
        case .formDropdown:
            return nil
        case .standalone:
            return AndesDropdownStyleStandAlone(borderColor: .clear)
        }
    }

}
