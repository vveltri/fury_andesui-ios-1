//
//  AndesRadioButtonTypeIdle.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation
//Handle radioButton Idle type
class AndesRadioButtonTypeIdle: AndesRadioButtonTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = UIColor.Andes.gray800
    var backgroundColor: UIColor = UIColor.Andes.white

    init() {

    }

    init(status: AndesRadioButtonStatus) {
        let statusProtocol = AndesRadioButtonStatusFactory.provide(status)
        self.borderSize = 2
        if status == .unselected {
            self.backgroundColor = UIColor.Andes.white
            self.borderColor = UIColor.Andes.gray250
        } else {
            self.backgroundColor = statusProtocol.backgroundColor
            self.borderColor = UIColor.Andes.white
        }
    }
}
