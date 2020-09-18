//
//  AndesTextfieldCodeFoursome.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class AndesTextfieldCodeFoursome: AndesTextfieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextfieldCodeFoursome", owner: self, options: nil)
    }
}
