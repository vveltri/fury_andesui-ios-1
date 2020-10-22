//
//  AndesListViewCellPaddingLarge.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListViewCellLargeType: AndesListViewCellTypeProtocol {

    var font: AndesFontStyle = AndesFontStyle(textColor: UIColor.Andes.gray800,
                                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyL),
                                              lineSpacing: 5)

    var height: CGFloat = 68

    var paddingLeft: CGFloat = 16

    var paddingRight: CGFloat = 16
}
