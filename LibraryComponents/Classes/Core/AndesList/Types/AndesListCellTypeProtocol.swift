//
//  AndesListCellTypeProtocol.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

internal protocol AndesListCellTypeProtocol {
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
    var thumbnailLeft: UIImage? { get }
    var thumbnailSize: CGFloat? { get }
    var separatorThumbnailWidth: CGFloat? { get }
    var paddingTopThumbnail: CGFloat? { get }
    var paddingBottomThumbnail: CGFloat? { get }
    var separatorChevronWidth: CGFloat? { get }
    var paddingTopChevron: CGFloat? { get }
    var paddingBottomChevron: CGFloat? { get }
}
