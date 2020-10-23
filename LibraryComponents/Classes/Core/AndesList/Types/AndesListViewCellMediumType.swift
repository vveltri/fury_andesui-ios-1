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

            heightConstraint = 48

            titleHeightConstraint = 11

            paddingLeft = 16

            paddingRight = 16

            paddingTop = 18

            paddingBottom = 19

            descriptionHeight = 0

            separatorHeight = 0
        } else {

            heightConstraint = 68

            titleHeightConstraint = 11

            paddingLeft = 16

            paddingRight = 16

            paddingTop = 18

            paddingBottom = 18

            descriptionHeight = 9

            separatorHeight = 11
        }
    }
}
