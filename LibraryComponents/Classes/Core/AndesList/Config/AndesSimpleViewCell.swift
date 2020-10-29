//
//  CellConfiguration.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesSimpleViewCell: AndesListViewCell {

    @available(swift, obsoleted: 1.0)
    @objc public init(withTitle title: String, size: AndesListSize, subTitle: String) {
        super.init()
        self.cellConfig(withTitle: title, size: size, subTitle: subTitle)
    }

    public init(withTitle title: String, size: AndesListSize? = .medium, subTitle: String? = String()) {
        super.init()
        guard let size = size, let subTitle = subTitle else { return }
        self.cellConfig(withTitle: title, size: size, subTitle: subTitle)
    }

    private func cellConfig(withTitle title: String, size: AndesListSize, subTitle: String) {
        let config = AndesListViewCellTypeFactory.provide(withSize: size, subTitle: !subTitle.isEmpty)
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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
