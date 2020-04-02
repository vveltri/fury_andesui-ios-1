//
//  AndesTextFieldDelegate.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/31/20.
//

import Foundation

@objc public protocol AndesTextFieldDelegate: UITextViewDelegate {
    @objc optional func andesTextFieldShouldBeginEditing(_ textField: AndesTextField) -> Bool
    @objc optional func andesTextFieldShouldEndEditing(_ textField: AndesTextField) -> Bool
    @objc optional func andesTextFieldDidBeginEditing(_ textField: AndesTextField)
    @objc optional func andesTextFieldDidEndEditing(_ textField: AndesTextField)
    @objc optional func andesTextField(_ textField: AndesTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    @objc optional func andesTextFieldDidChangeSelection(_ textField: AndesTextField, selectedRange range: UITextRange?)
    @objc optional func andesTextFieldDidChange(_ textField: AndesTextField)
}
