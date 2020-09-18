//
//  AndesTextfieldCodeThreesome.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

final class AndesTextfieldCodeThreesome: AndesTextfieldCodeAbstractView {

    override internal func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextfieldCodeThreesome", owner: self, options: nil)
    }
}
