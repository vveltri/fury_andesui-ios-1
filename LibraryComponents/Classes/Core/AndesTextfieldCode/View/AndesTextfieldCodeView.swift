//
//  AndesTextfieldCodeView.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesCodeTextField
 */
protocol AndesTextfieldCodeView: UIView {
    var text: String { get set }
    func update(withConfig config: AndesTextFieldCodeViewConfig)
}
