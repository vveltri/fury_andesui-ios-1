//
//  AndesDropdownFormDropDownRow.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class FormDropdownCell: AndesDropdownTrigger {
    public private(set) var placeholder: String?

    public init(title: String? = String(), placeholder: String? = String()) {
        super.init(title: title ?? "", type: .formDropdown)
        self.placeholder = placeholder
    }
}
