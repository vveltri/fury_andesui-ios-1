//
//  AndesListDefaultViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import UIKit

class AndesListDefaultViewCell: AndesListViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var paddingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func display(indexPath: IndexPath, customCell: AndesListViewCell) {
        self.titleLbl.text = customCell.title
        self.titleLbl.setAndesStyle(style: customCell.fontStyle)
        self.titleLbl.heightAnchor.constraint(greaterThanOrEqualToConstant: customCell.titleHeightConstraint).isActive = true
        self.descriptionLbl.text = customCell.descriptionText
        self.descriptionLbl.setAndesStyle(style: customCell.fontDescriptionStyle)
        self.descriptionLbl.heightAnchor.constraint(equalToConstant: customCell.descriptionHeight).isActive = true
        self.paddingLeftConstraint.constant = customCell.paddingLeftCell
        self.paddingRightConstraint.constant = customCell.paddingRightCell
        self.paddingTopConstraint.constant = customCell.paddingTopCell
        self.paddingBottomConstraint.constant = customCell.paddingBottomCell
        self.separatorHeightConstraint.constant = customCell.separatorHeight
    }
}
