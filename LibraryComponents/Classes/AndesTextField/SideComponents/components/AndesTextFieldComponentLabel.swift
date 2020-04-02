//
//  AndesTextFieldComponentLabel.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation

@objc public class AndesTextFieldComponentLabel: NSObject, AndesTextFieldLeftComponent, AndesTextFieldRightComponent {
    public let text: String

    public init(text: String) {
        self.text = text
        super.init()
    }
}
