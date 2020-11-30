//
//  AndesDropdownStyleFactory.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownStyleFactory {

    static func getStyle(_ trigger: AndesDropdownTriggerType) -> AndesDropdownStyleProtocol {
        switch trigger {
        case .formDropdown:
            return AndesDropdownStyleFormDropdown(borderColor: UIColor.Andes.gray250)
        case .standalone:
            return AndesDropdownStyleStandAlone(borderColor: .clear)
        }
    }

}
