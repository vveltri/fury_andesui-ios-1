//
//  CellConfiguration.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesDefaultViewCellConfig: AndesListViewCell {

    @objc public init(withTitle title: String, size: AndesListSize, descriptionTitle: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesDefaultCell")
        cellConfig(withTitle: title, size: size, descriptionTitle: descriptionTitle)
    }

    public init(withTitle title: String, size: AndesListSize? = .medium, descriptionTitle: String? = String()) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesDefaultCell")
        guard let size = size, let descriptionTitle = descriptionTitle else { return }
        cellConfig(withTitle: title, size: size, descriptionTitle: descriptionTitle)
    }

    private func cellConfig(withTitle title: String, size: AndesListSize, descriptionTitle: String) {
        let hasDescription = (description.isEmpty ) ? false : true
        let config = AndesListViewCellTypeFactory.provide(withSize: size, hasDescription: hasDescription)
        self.type = .simple
        self.title = title
        self.descriptionTitle = descriptionTitle
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
