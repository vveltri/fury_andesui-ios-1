//
//  AndesTextFieldComponentAction.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation
@objc public class AndesTextFieldComponentAction: NSObject, AndesTextFieldRightComponent {

    @objc public private(set) var label: String

    @objc public init(_ actionLabel: String) {
        label = actionLabel
    }

}
