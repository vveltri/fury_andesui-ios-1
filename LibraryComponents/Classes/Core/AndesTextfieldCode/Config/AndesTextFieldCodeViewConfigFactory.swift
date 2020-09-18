//
//  AndesTextFieldCodeViewConfigFactory.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class AndesTextFieldCodeViewConfigFactory {

    static func provideInternalConfig(from textFieldCode: AndesTextfieldCode) -> AndesTextFieldCodeViewConfig {
        let label = textFieldCode.label
        let helpLabel = textFieldCode.helpLabel
        let style = textFieldCode.style
        return AndesTextFieldCodeViewConfig(label: label, helpLabel: helpLabel, style: style)
    }
}
