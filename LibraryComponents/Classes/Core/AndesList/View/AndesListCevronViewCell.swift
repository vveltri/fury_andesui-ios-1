//
//  AndesListCevronViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 26/10/20.
//

import UIKit

class AndesListCevronViewCell: AndesListSimpleViewCell {

    @IBOutlet weak var chevronImg: UIImageView!
    @IBOutlet weak var chevronWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var chevronHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var spaceChevronWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopChevronConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomChevronConstraint: NSLayoutConstraint!

    internal override func display(indexPath: IndexPath, customCell: AndesListViewCell, separatorStyle: AndesSeparatorStyle) {
        self.titleLbl.text = customCell.title
        self.titleLbl.setAndesStyle(style: customCell.fontStyle)
        self.titleLbl.heightAnchor.constraint(greaterThanOrEqualToConstant: customCell.titleHeight).isActive = true
        self.subTitleLbl.text = customCell.subTitle
        self.subTitleLbl.setAndesStyle(style: customCell.fontSubTitleStyle)
        self.subTitleLbl.heightAnchor.constraint(equalToConstant: customCell.subTitleHeight).isActive = true
        self.paddingLeftConstraint.constant = customCell.paddingLeftCell
        self.paddingRightConstraint.constant = customCell.paddingRightCell
        self.paddingTopConstraint.constant = customCell.paddingTopCell
        self.paddingBottomConstraint.constant = customCell.paddingBottomCell
        self.separatorHeightConstraint.constant = customCell.separatorHeight
        AndesIconsProvider.loadIcon(name: customCell.chevron ?? "", placeItInto: self.chevronImg)
        if let chevronSize = customCell.chevronSize {
            self.chevronWidthConstraint.constant = chevronSize
            self.chevronHeightConstraint.constant = chevronSize
            self.chevronImg.tintColor = UIColor.Andes.gray450
            self.paddingTopChevronConstraint.constant = customCell.paddingTopChevron ?? 0
            self.paddingBottomChevronConstraint.constant = customCell.paddingBottomChevron ?? 0
            self.spaceChevronWidthConstraint.constant = customCell.separatorChevronWidth ?? 0
        }
        if let imageSize = customCell.thumbnailSize {
            self.thumbnailWidthConstraint.constant = imageSize
            self.thumbnailHeightConstraint.constant = imageSize
            self.paddingTopThumbnailConstraint.constant = customCell.paddingTopThumbnail ?? 0
            self.paddingBottomThumbnailConstraint.constant = customCell.paddingBottomThumbnail ?? 0
            self.thumbnailImg.image = customCell.thumbnailLeft
            self.spaceThumbnailWidthConstraint.constant = customCell.separatorThumbnailWidth ?? 0
        }
        setupSeparatorStyle(separatorStyle: separatorStyle)
    }

}
