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

    var heightConstraint: CGFloat

    var paddingLeft: CGFloat

    var paddingRight: CGFloat

    var paddingTop: CGFloat

    var paddingBottom: CGFloat

    var descriptionHeight: CGFloat

    var separatorHeight: CGFloat

    var titleHeightConstraint: CGFloat

    init() {

        heightConstraint = 40

        titleHeightConstraint = 9

        paddingLeft = 16

        paddingRight = 16

        paddingTop = 15

        paddingBottom = 16

        descriptionHeight = 0

        separatorHeight = 0
    }
}
