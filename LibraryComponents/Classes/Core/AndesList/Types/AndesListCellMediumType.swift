//
//  AndesListCellMediumType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 22/10/20.
//

import Foundation

struct AndesListCellMediumType: AndesListCellTypeProtocol {

    var font = AndesFontStyle(textColor: UIColor.Andes.gray800,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyM),
                              lineSpacing: 2)
    var fontDescription = AndesFontStyle(textColor: UIColor.Andes.gray450,
                              font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: AndesFontSize.bodyS),
                              lineSpacing: 1)
    var chevronImage: String = "andes_ui_chevron_right_16"
    var thumbnailLeft: UIImage?

    init(thumbnail: AndesThumbnail? = nil) {
        if let thumbnail = thumbnail {
            thumbnailLeft = thumbnail.image
        }
    }
}
