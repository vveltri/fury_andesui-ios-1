//
//  AndesListViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import UIKit

@objc public class AndesListViewCell: UITableViewCell {

    public var title: String = String()
    public var descriptionText: String = String()
    public var type: AndesCellType?
    public var fontStyle: AndesFontStyle = AndesFontStyle(textColor: .black,
                                                          font: UIFont.boldSystemFont(ofSize: 16),
                                                          lineSpacing: 2)
    public var fontDescriptionStyle: AndesFontStyle = AndesFontStyle(textColor: .black,
                                                                     font: UIFont.boldSystemFont(ofSize: 16),
                                                                     lineSpacing: 2)
    public var paddingLeftCell: CGFloat = 0
    public var paddingRightCell: CGFloat = 0
    public var paddingTopCell: CGFloat = 0
    public var paddingBottomCell: CGFloat = 0
    public var descriptionHeight: CGFloat = 0
    public var separatorHeight: CGFloat = 0
    public var heightConstraint: CGFloat = 0
    public var titleHeightConstraint: CGFloat = 0

    var view = self

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "AndesListViewCell")
        setup()
    }

    private func setup() {
        self.backgroundColor = .clear
//        drawContentView()
    }

    private func drawContentView() {
        leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
