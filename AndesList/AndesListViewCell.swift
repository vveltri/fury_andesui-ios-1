//
//  AndesListViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import UIKit

@objc public class AndesListViewCell: UITableViewCell {

    public var title: String
    public var type: AndesCellType?

    var view = self

    required init?(coder: NSCoder) {
        self.title = String()
        super.init(coder: coder)
        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.title = String()
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesListViewCell")
        setup()
    }

    private func setup() {
        self.backgroundColor = .clear
        drawContentView()
    }

    private func drawContentView() {
        leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
