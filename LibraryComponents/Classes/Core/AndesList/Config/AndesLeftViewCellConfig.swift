//
//  CustomIconCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesLeftViewCellConfig: AndesListViewCell {
    public var icon: AndesThumbnail?

    public init(title: String, icon: AndesThumbnail? = nil, size: AndesListSize? = nil) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesListLeftViewCell")
        let config = AndesListViewCellTypeFactory.provide(withSize: size ?? AndesListSize.medium)
        self.type = .andesLeft
        self.icon = icon
        self.title = title
        self.heightCell = config.height
        self.fontStyle = config.font
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
