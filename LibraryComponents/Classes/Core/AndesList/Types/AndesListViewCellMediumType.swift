//
//  AndesListViewCellPaddingMedium.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListViewCellMediumType: AndesListViewCellTypeProtocol {

    var font: AndesFontStyle = AndesFontStyle(textColor: AndesStyleSheetManager.styleSheet.textColorPrimary,
                                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM),
                                              lineSpacing: 5)

    var height: CGFloat = 48

    var paddingLeft: CGFloat = 16

    var paddingRight: CGFloat = 16
}
