//
//  AndesFieldPadding.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/24/20.
//

import Foundation
internal struct AndesFieldPadding {
    let top: CGFloat
    let left: CGFloat
    let bottom: CGFloat
    let right: CGFloat

    static var defaultPadding: AndesFieldPadding {
        return AndesFieldPadding(top: 13, left: 12, bottom: 13, right: 12)
    }
}
