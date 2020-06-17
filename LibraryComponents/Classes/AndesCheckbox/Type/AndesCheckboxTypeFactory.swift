//
//  AndesCheckboxTypeFactory.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/16/20.
//

import Foundation
class AndesCheckboxTypeFactory {
    static func provide(_ type: AndesCheckboxType) -> AndesCheckboxTypeProtocol {
        switch type {
        case .disabled:
            return AndesCheckboxTypeDisabled()
        case .idle:
            return AndesCheckboxTypeIdle()
        case .error:
            return AndesCheckboxTypeError()
        }
    }
}
