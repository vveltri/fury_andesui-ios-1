//
//  CellConfiguration.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public class AndesDefaultCell: AndesListViewCell {

    public init(title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesListDefaultViewCell")
        self.type = .andesDefault
        self.title = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
