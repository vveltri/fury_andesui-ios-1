//
//  CustomIconCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesLeftCell: AndesListViewCell {
    public var icon: AndesThumbnail?

    public init(title: String, icon: AndesThumbnail? = nil) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesIconCell")
        self.type = .andesIcon
        self.icon = icon
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
