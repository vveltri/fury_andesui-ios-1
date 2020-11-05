//
//  AndesListCellSmallType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListCellSmallType: AndesListCellTypeProtocol {

    var font = AndesFontStyle(textColor: UIColor.Andes.gray800,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyS),
                              lineSpacing: 5)
    var fontDescription = AndesFontStyle(textColor: UIColor.Andes.gray450,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyXS),
                              lineSpacing: 5)

    var chevronImage: String = "andes_ui_chevron_right_12"
    var thumbnailLeft: UIImage?

    init(withThumbnail thumbnail: AndesThumbnail? = nil) {
       if let thumbnail = thumbnail {
        thumbnailLeft = thumbnail.image
        }
    }
}
