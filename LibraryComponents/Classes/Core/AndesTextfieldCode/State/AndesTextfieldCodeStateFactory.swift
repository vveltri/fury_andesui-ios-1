//
//  AndesTextfieldCodeStateFactory.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

final class AndesTextfieldCodeStateFactory {
    static func getState(_ state: AndesTextfieldCodeState) -> AndesTextfieldCodeStateProtocol {
        switch state {
        case .idle:
            return AndesTextfieldCodeStateIdle()
        case .error:
            return AndesTextfieldCodeStateError()
        case .disabled:
            return AndesTextfieldCodeStateDisabled()
        }
    }
}
