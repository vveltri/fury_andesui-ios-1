//
//  CustomIconCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesLeftViewCellConfig: AndesListViewCell {
    public var icon: AndesThumbnail?

    public init(title: String, icon: AndesThumbnail? = nil, size: AndesListSize? = nil, description: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesListLeftViewCell")
        let hasDescription = description.isEmpty ? false : true
        let config = AndesListViewCellTypeFactory.provide(withSize: size ?? AndesListSize.medium, hasDescription: hasDescription)
        self.type = .chevron
        self.icon = icon
        self.title = title
        self.fontStyle = config.font
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
