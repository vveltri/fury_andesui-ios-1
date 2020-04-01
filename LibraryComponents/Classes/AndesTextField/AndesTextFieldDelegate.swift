//
//  AndesTextFieldDelegate.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/31/20.
//

import Foundation

@objc public protocol AndesTextFieldDelegate: UITextViewDelegate {
    @objc optional func AndesTextFieldShouldBeginEditing(_ textField: AndesTextField) -> Bool
    @objc optional func AndesTextFieldShouldEndEditing(_ textField: AndesTextField) -> Bool
    @objc optional func AndesTextFieldDidBeginEditing(_ textField: AndesTextField)
    @objc optional func AndesTextFieldDidEndEditing(_ textField: AndesTextField)
    @objc optional func AndesTextField(_ textField: AndesTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    @objc optional func AndesTextFieldDidChangeSelection(_ textField: AndesTextField, selectedRange range: UITextRange?)
    @objc optional func AndesTextFieldDidChange(_ textField: AndesTextField)
}
