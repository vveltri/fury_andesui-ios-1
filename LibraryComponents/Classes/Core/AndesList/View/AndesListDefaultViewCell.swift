//
//  AndesListDefaultViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import UIKit

class AndesListDefaultViewCell: AndesListViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingRightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func display(indexPath: IndexPath, customCell: AndesListViewCell) {
        self.titleLbl.text = customCell.title
        self.titleLbl.setAndesStyle(style: customCell.fontStyle)
        self.heightConstraint.constant = customCell.heightCell
        self.paddingLeftConstraint.constant = customCell.paddingLeftCell
        self.paddingRightConstraint.constant = customCell.paddingRightCell
    }
}
