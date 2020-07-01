//
//  AndesRadioButtonTypeDisabled.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation
//Handle radiobutton disabled type
class AndesRadioButtonTypeDisabled: AndesRadioButtonTypeProtocol {
    var borderColor: UIColor?
    var borderSize: CGFloat?
    var textColor: UIColor = UIColor.Andes.gray250
    var backgroundColor: UIColor = UIColor.Andes.gray100

    init() {

    }

    init(status: AndesRadioButtonStatus) {
        let statusProtocol = AndesRadioButtonStatusFactory.provide(status)
        self.borderSize = 2
        if status == .unselected {
            self.backgroundColor = UIColor.Andes.white
            self.borderColor = UIColor.Andes.gray250
        } else {
            self.backgroundColor = UIColor.Andes.gray100
            self.borderColor = UIColor.Andes.gray100
        }
    }
}
