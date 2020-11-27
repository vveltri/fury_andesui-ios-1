//
//  AndesDropdownFormDropdownTriggerType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class AndesDropdownTrigger: NSObject {
    private(set) var title: String?
    private(set) var type: AndesDropdownTriggerType

    internal init(title: String = String(), type: AndesDropdownTriggerType = .formDropdown) {
        self.title = title
        self.type = type
    }
}
