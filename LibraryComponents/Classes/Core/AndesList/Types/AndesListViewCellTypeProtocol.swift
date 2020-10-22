//
//  AndesListViewCellPaddingProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

internal protocol AndesListViewCellTypeProtocol {
    var font: AndesFontStyle { get }
    var height: CGFloat { get }
    var paddingLeft: CGFloat { get }
    var paddingRight: CGFloat { get }
}
