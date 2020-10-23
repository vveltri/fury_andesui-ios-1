//
//  AndesListViewCellPaddingProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

internal protocol AndesListViewCellTypeProtocol {
    var font: AndesFontStyle { get }
    var fontDescription: AndesFontStyle { get }
    var heightConstraint: CGFloat { get }
    var paddingLeft: CGFloat { get }
    var paddingRight: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var descriptionHeight: CGFloat { get }
    var separatorHeight: CGFloat { get }
    var titleHeightConstraint: CGFloat { get }
}
