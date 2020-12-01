//
//  AndesDropdownFormDropdownTriggerType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

public class AndesDropdownTrigger: NSObject {
    private(set) var type: AndesDropdownTriggerType

    internal init(type: AndesDropdownTriggerType = .formDropdown) {
        self.type = type
    }
}
