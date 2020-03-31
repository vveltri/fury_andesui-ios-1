//
//  AndesTextFieldViewDelegate.swift
//  AndesUI
//
//  Created by Martin Damico on 12/03/2020.
//

import Foundation

internal protocol AndesTextFieldViewDelegate: AnyObject {
    func didBeginEditing()
    func didEndEditing(text: String)
}
