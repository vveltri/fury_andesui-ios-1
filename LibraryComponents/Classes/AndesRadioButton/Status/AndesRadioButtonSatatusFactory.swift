//
//  AndesRadioButtonSatatusFactory.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation
class AndesRadioButtonStatusFactory {
    static func provide(_ type: AndesRadioButtonStatus) -> AndesRadioButtonStatusProtocol {
        switch type {
        case .selected:
            return AndesRadioButtonStatusSelected()
        case .unselected:
            return AndesRadioButtonStatusUnselected()
        }
    }
}
