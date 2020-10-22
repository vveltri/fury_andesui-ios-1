//
//  CellConfiguration.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesDefaultViewCellConfig: AndesListViewCell {

    @objc public init(withTitle title: String, size: AndesListSize) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesDefaultCell")
        let config = AndesListViewCellTypeFactory.provide(withSize: size)
        self.type = .andesDefault
        self.title = title
        self.heightCell = config.height
        self.fontStyle = config.font
        self.paddingLeftCell = config.paddingLeft
        self.paddingRightCell = config.paddingRight
    }

    public init(withTitle title: String, size: AndesListSize? = .medium) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesDefaultCell")
        guard let size = size else { return }
        let config = AndesListViewCellTypeFactory.provide(withSize: size)
        self.type = .andesDefault
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
