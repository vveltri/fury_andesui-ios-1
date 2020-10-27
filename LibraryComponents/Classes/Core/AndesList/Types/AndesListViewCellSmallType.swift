//
//  AndesListViewCellPaddingSmall.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListViewCellSmallType: AndesListViewCellTypeProtocol {

    var font = AndesFontStyle(textColor: UIColor.Andes.gray800,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyS),
                              lineSpacing: 5)
    var fontDescription = AndesFontStyle(textColor: UIColor.Andes.gray450,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyXS),
                              lineSpacing: 5)
    var height: CGFloat = 40
    var paddingLeft: CGFloat = 16
    var paddingRight: CGFloat = 16
    var paddingTop: CGFloat = 15
    var paddingBottom: CGFloat = 16
    var descriptionHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var titleHeight: CGFloat = 9
    var chevronImage: String? = "andes_ui_chevron_right_12"
    var chevronSize: CGFloat? = 12
    var imageLeft: UIImage?
    var imageSizeConstraint: CGFloat? = 0
    var separatorImageWidth: CGFloat? = 0
    var paddingTopImage: CGFloat?
    var paddingBottomImage: CGFloat?
    var paddingBottomChevron: CGFloat? = 18
    var paddingTopChevron: CGFloat? = 18
    var separatorChevronWidth: CGFloat? = 12

    init(withThumbnail thumbnail: AndesThumbnail? = nil) {
       if let thumbnail = thumbnail {
        imageLeft = thumbnail.image
            switch thumbnail.type {
            case .icon:
                imageSizeConstraint = 16
                separatorImageWidth = 8
                paddingTopImage = 16
            case .imageCircle, .imageSquare:
                height = 56
                imageSizeConstraint = 32
                separatorImageWidth = 12
                paddingTopImage = 12
                paddingBottomImage = 12
                paddingTopChevron = 22
                paddingBottomChevron = 22
            }
        }
    }
}
