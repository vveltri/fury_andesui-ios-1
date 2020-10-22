//
//  AndesListViewCellPaddingSmall.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListViewCellSmallType: AndesListViewCellTypeProtocol {

    var font: AndesFontStyle = AndesFontStyle(textColor: AndesStyleSheetManager.styleSheet.textColorPrimary,
                                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyS),
                                              lineSpacing: 0)

    var height: CGFloat = 40

    var paddingLeft: CGFloat = 16

    var paddingRight: CGFloat = 16
}
