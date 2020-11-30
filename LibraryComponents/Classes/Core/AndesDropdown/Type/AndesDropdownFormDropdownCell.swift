//
//  AndesDropdownFormDropDownRow.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public class FormDropdownCell: AndesDropdownTrigger {
    var placeholder: String?

    public init(title: String?, text: String, placeholder: String) {
        super.init(title: title ?? "", text: text)
        self.placeholder = placeholder
    }
}
