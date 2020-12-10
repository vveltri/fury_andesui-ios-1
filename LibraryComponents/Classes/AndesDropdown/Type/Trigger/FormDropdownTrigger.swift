//
//  AndesDropdownFormDropDownRow.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class FormDropdownTrigger: AndesDropdownTrigger {
    public private(set) var title: String?
    public private(set) var placeholder: String?
    /// This class define the formDropdown trigger
    /// - Parameters:
    ///   - title: Define the title
    ///   - placeholder: Define the placeholder
    @objc public init(title: String? = String(), placeholder: String? = String()) {
        self.placeholder = placeholder
        self.title = title
        super.init(type: .formDropdown)
    }
}
