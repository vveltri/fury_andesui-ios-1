//
//  AndesSimpleViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesSimpleCell: AndesListCell {

    @available(swift, obsoleted: 1.0)
    @objc public init(withTitle title: String, size: AndesListSize, subTitle: String, thumbnail: AndesThumbnail? = nil) {
        super.init()
        self.cellConfig(withTitle: title, size: size, subTitle: subTitle, thumbnail: thumbnail)
    }

    public init(withTitle title: String, size: AndesListSize? = .medium, subTitle: String? = String(), thumbnail: AndesThumbnail? = nil) {
        super.init()
        guard let size = size, let subTitle = subTitle else { return }
        self.cellConfig(withTitle: title, size: size, subTitle: subTitle, thumbnail: thumbnail)
    }

    private func cellConfig(withTitle title: String, size: AndesListSize, subTitle: String, thumbnail: AndesThumbnail? = nil) {
        let config = AndesListCellTypeFactory.provide(withSize: size, subTitle: !subTitle.isEmpty, thumbnail: thumbnail)
        self.type = .simple
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
        self.thumbnailLeft = config.thumbnailLeft
        self.thumbnailSize = config.thumbnailSize
        self.separatorThumbnailWidth = config.separatorThumbnailWidth
        self.paddingTopThumbnail = config.paddingTopThumbnail
        self.paddingBottomThumbnail = config.paddingBottomThumbnail
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
