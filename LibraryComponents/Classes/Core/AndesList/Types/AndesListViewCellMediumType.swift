//
//  AndesListViewCellPaddingMedium.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListViewCellMediumType: AndesListViewCellTypeProtocol {

    var font = AndesFontStyle(textColor: UIColor.Andes.gray800,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM),
                              lineSpacing: 2)
    var fontDescription = AndesFontStyle(textColor: UIColor.Andes.gray450,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyS),
                              lineSpacing: 1)
    var height: CGFloat = 48
    var paddingLeft: CGFloat = 16
    var paddingRight: CGFloat = 16
    var paddingTop: CGFloat = 18
    var paddingBottom: CGFloat = 19
    var descriptionHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var titleHeight: CGFloat = 11
    var chevronImage: String? = "andes_ui_chevron_right_16"
    var chevronSize: CGFloat? = 16
    var imageLeft: UIImage?
    var imageSizeConstraint: CGFloat? = 0
    var separatorImageWidth: CGFloat? = 0
    var paddingTopImage: CGFloat?
    var paddingBottomImage: CGFloat?
    var paddingBottomChevron: CGFloat? = 20
    var paddingTopChevron: CGFloat? = 20
    var separatorChevronWidth: CGFloat? = 12

    init(withDescription hasDescription: Bool, thumbnail: AndesThumbnail? = nil) {
        if hasDescription {
            height = 68
            paddingBottom = 18
            descriptionHeight = 9
            separatorHeight = 11
        }
        if let thumbnail = thumbnail {
            imageLeft = thumbnail.image
            switch thumbnail.type {
            case .icon:
                imageSizeConstraint = 20
                separatorImageWidth = 12
                paddingTopImage =  18
            case .imageCircle, .imageSquare:
                height = 68
                imageSizeConstraint = 40
                separatorImageWidth = 16
                paddingTopImage = hasDescription ? 18 : 14
                paddingBottomImage = 14
                paddingTopChevron = hasDescription ? 30 : 26
                paddingBottomChevron = 26
            }
        }
    }
}
