//
//  AndesDropdownFormDropDownRow.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class FormDropdownTrigger: AndesDropdownTrigger {
    public private(set) var placeholder: String?

    @objc public init(title: String? = String(), placeholder: String? = String()) {
        self.placeholder = placeholder
        super.init(title: title ?? "", type: .formDropdown)
    }
}
