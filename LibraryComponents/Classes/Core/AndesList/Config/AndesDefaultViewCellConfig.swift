//
//  CellConfiguration.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesDefaultViewCellConfig: AndesListViewCell {

    @objc public init(withTitle title: String, size: AndesListSize, descriptionText: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesDefaultCell")
        cellConfig(withTitle: title, size: size, descriptionText: descriptionText)
    }

    public init(withTitle title: String, size: AndesListSize? = .medium, descriptionText: String? = String()) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesDefaultCell")
        guard let size = size, let descriptionText = descriptionText else { return }
        cellConfig(withTitle: title, size: size, descriptionText: descriptionText)
    }

    private func cellConfig(withTitle title: String, size: AndesListSize, descriptionText: String) {
        let hasDescription = (descriptionText.isEmpty ) ? false : true
        let config = AndesListViewCellTypeFactory.provide(withSize: size, hasDescription: hasDescription)
        self.type = .simple
        self.title = title
        self.descriptionText = descriptionText
        self.fontStyle = config.font
        self.fontDescriptionStyle = config.fontDescription
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
        self.paddingTopCell = config.paddingTop
        self.paddingBottomCell = config.paddingBottom
        self.descriptionHeight = config.descriptionHeight
        self.separatorHeight = config.separatorHeight
        self.heightConstraint = config.heightConstraint
        self.titleHeightConstraint = config.titleHeightConstraint
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
