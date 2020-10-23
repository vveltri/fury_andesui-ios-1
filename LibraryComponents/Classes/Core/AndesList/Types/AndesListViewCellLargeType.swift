//
//  AndesListViewCellPaddingLarge.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListViewCellLargeType: AndesListViewCellTypeProtocol {

    var font = AndesFontStyle(textColor: UIColor.Andes.gray800,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyL),
                              lineSpacing: 5)

    var fontDescription = AndesFontStyle(textColor: UIColor.Andes.gray450,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM),
                              lineSpacing: 5)

    var heightConstraint: CGFloat

    var paddingLeft: CGFloat

    var paddingRight: CGFloat

    var paddingTop: CGFloat

    var paddingBottom: CGFloat

    var descriptionHeight: CGFloat

    var separatorHeight: CGFloat

    var titleHeightConstraint: CGFloat

    init(withDescription hasDescription: Bool) {
        if !hasDescription {

            heightConstraint = 68

            titleHeightConstraint = 12

            paddingLeft = 24

            paddingRight = 24

            paddingTop = 28

            paddingBottom = 28

            descriptionHeight = 0

            separatorHeight = 0
        } else {

            heightConstraint = 96

            titleHeightConstraint = 12

            paddingLeft = 24

            paddingRight = 24

            paddingTop = 28

            paddingBottom = 29

            descriptionHeight = 10

            separatorHeight = 15
        }
    }
}
