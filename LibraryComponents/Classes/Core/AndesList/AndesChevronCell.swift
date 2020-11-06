//
//  AndesChevronViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 26/10/20.
//

import Foundation

/**
 This class is a custom cell to AndesUI, this cell has a basic configuration and a chevron to the right
*/
public class AndesChevronCell: AndesListCell {

    /**
     This method initialize an AndesChevronCell with title, size, subtitle, thumbnail and numberOfLines
     - Parameters:
       - title: Set the title for the cell
       - size: Set the size for the cell, the values are small, medium and large, the default is medium
       - subTitle: Set the subtitle for the cell
       - thumbnail: Set a thumbnail to the left of the cell
       - numberOfLines: Set the number of lines to the cell title, the default is 0
     - Author: Mobile architecture
     - Date: november 6th, 2020
    */
    @available(swift, obsoleted: 1.0)
    @objc public init(withTitle title: String,
                      size: AndesListSize,
                      subTitle: String,
                      thumbnail: AndesThumbnail? = nil,
                      numberOfLines: Int) {
        super.init()
        self.cellConfig(withTitle: title, size: size, subTitle: subTitle, thumbnail: thumbnail, numberOfLines: numberOfLines)
    }

    /**
     This method initialize an AndesChevronCell with title, size, subtitle, thumbnail and numberOfLines
     - Parameters:
       - title: Set the title for the cell
       - size: Set the size for the cell, the values are small, medium and large, the default is medium
       - subTitle: Set the subtitle for the cell
       - thumbnail: Set a thumbnail to the left of the cell
       - numberOfLines: Set the number of lines to the cell title, the default is 0
     - Author: Mobile architecture
     - Date: november 6th, 2020
    */
    public init(withTitle title: String,
                size: AndesListSize? = .medium,
                subTitle: String? = String(),
                thumbnail: AndesThumbnail? = nil, numberOfLines: Int = 0) {
        super.init()
        guard let size = size, let subTitle = subTitle else { return }
        self.cellConfig(withTitle: title, size: size, subTitle: subTitle, thumbnail: thumbnail, numberOfLines: numberOfLines)
    }

    private func cellConfig(withTitle title: String,
                            size: AndesListSize,
                            subTitle: String,
                            thumbnail: AndesThumbnail? = nil,
                            numberOfLines: Int) {
        let config = AndesListCellFactory.provide(withSize: size,
                                                      subTitleIsEmpty: subTitle.isEmpty,
                                                      thumbnail: thumbnail)
        self.type = .chevron
        self.title = title
        self.subTitle = subTitle
        self.fontStyle = config.font
        self.fontSubTitleStyle = config.fontDescription
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
        self.paddingTopCell = config.paddingTop
        self.paddingBottomCell = config.paddingBottom
        self.subTitleHeight = config.descriptionHeight
        self.separatorHeight = config.separatorHeight
        self.heightConstraint = config.height
        self.titleHeight = config.titleHeight
        self.chevron = config.chevronImage
        self.chevronSize = config.chevronSize
        self.thumbnailLeft = config.thumbnailLeft
        self.thumbnailSize = config.thumbnailSize
        self.separatorThumbnailWidth = config.separatorThumbnailWidth
        self.paddingTopThumbnail = config.paddingTopThumbnail
        self.paddingBottomThumbnail = config.paddingBottomThumbnail
        self.paddingTopChevron = config.paddingTopChevron
        self.paddingBottomChevron = config.paddingBottomChevron
        self.separatorChevronWidth = config.separatorChevronWidth
        self.numberOfLines = numberOfLines
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
