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
        case .IDLE:
            return AndesTextfieldCodeStateIdle()
        case .ERROR:
            return AndesTextfieldCodeStateError()
        case .DISABLED:
            return AndesTextfieldCodeStateDisabled()
        }
    }
}
