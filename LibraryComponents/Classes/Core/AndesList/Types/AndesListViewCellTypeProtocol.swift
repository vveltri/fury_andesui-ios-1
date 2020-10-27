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
    var height: CGFloat { get }
    var paddingLeft: CGFloat { get }
    var paddingRight: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var descriptionHeight: CGFloat { get }
    var separatorHeight: CGFloat { get }
    var titleHeight: CGFloat { get }
    var chevronImage: String? { get }
    var chevronSize: CGFloat? { get }
    var imageLeft: UIImage? { get }
    var imageSizeConstraint: CGFloat? { get }
    var separatorImageWidth: CGFloat? { get }
    var paddingTopImage: CGFloat? { get }
    var paddingBottomImage: CGFloat? { get }
    var separatorChevronWidth: CGFloat? { get }
    var paddingTopChevron: CGFloat? { get }
    var paddingBottomChevron: CGFloat? { get }
}
