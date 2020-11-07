//
//  AndesListCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import UIKit

@objc public class AndesListCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var thumbnailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumbnailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var spaceThumbnailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopThumbnailConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomThumbnailConstraint: NSLayoutConstraint!

    var title: String = String()
    var subtitle: String = String()
    var type: AndesCellType?
    var fontStyle: AndesFontStyle = AndesFontStyle(textColor: .black,
                                                          font: UIFont.boldSystemFont(ofSize: 16),
                                                          lineSpacing: 2)
    var fontSubTitleStyle: AndesFontStyle = AndesFontStyle(textColor: .black,
                                                                     font: UIFont.boldSystemFont(ofSize: 16),
                                                                     lineSpacing: 2)
    var paddingLeftCell: CGFloat = 0
    var paddingRightCell: CGFloat = 0
    var paddingTopCell: CGFloat = 0
    var paddingBottomCell: CGFloat = 0
    var subTitleHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var heightConstraint: CGFloat = 0
    var titleHeight: CGFloat = 0
    var chevron: String?
    var chevronSize: CGFloat? = 0
    var thumbnailLeft: UIImage?
    var thumbnailSize: CGFloat?
    var separatorThumbnailWidth: CGFloat? = 0
    var paddingTopThumbnail: CGFloat? = 0
    var paddingBottomThumbnail: CGFloat? = 0
    var separatorChevronWidth: CGFloat? = 0
    var paddingTopChevron: CGFloat? = 0
    var paddingBottomChevron: CGFloat? = 0
    var numberOfLines: Int = 0

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
    }

    func setup(customCell: AndesListCell, separatorStyle: AndesSeparatorStyle) {
        self.titleLbl.text = customCell.title
        self.titleLbl.setAndesStyle(style: customCell.fontStyle)
        self.titleLbl.heightAnchor.constraint(greaterThanOrEqualToConstant: customCell.titleHeight).isActive = true
        self.subtitleLbl.text = customCell.subtitle
        self.subtitleLbl.setAndesStyle(style: customCell.fontSubTitleStyle)
        self.descriptionHeightConstraint.constant = customCell.subTitleHeight
        self.paddingLeftConstraint.constant = customCell.paddingLeftCell
        self.paddingRightConstraint.constant = customCell.paddingRightCell
        self.paddingTopConstraint.constant = customCell.paddingTopCell
        self.paddingBottomConstraint.constant = customCell.paddingBottomCell
        self.separatorHeightConstraint.constant = customCell.separatorHeight
        if let imageSize = customCell.thumbnailSize, imageSize != 0.0 {
            self.thumbnailWidthConstraint.constant = imageSize
            self.thumbnailHeightConstraint.constant = imageSize
            self.paddingTopThumbnailConstraint.constant = customCell.paddingTopThumbnail ?? 0
            self.paddingBottomThumbnailConstraint.constant = customCell.paddingBottomThumbnail ?? 0
            self.thumbnailImg.image = customCell.thumbnailLeft
            self.spaceThumbnailWidthConstraint.constant = customCell.separatorThumbnailWidth ?? 0
        } else {
            self.thumbnailWidthConstraint.constant = 0
            self.thumbnailHeightConstraint.constant = 0
            self.paddingTopThumbnailConstraint.constant = 0
            self.paddingBottomThumbnailConstraint.constant = 0
            self.thumbnailImg.image = nil
            self.spaceThumbnailWidthConstraint.constant = 0
        }
        self.titleLbl.adjustsFontSizeToFitWidth = false
        self.titleLbl.lineBreakMode = .byTruncatingTail
        self.titleLbl.numberOfLines = customCell.numberOfLines
        self.subtitleLbl.adjustsFontSizeToFitWidth = false
        self.subtitleLbl.lineBreakMode = .byTruncatingTail
        setupSeparatorStyle(separatorStyle: separatorStyle)
    }

    func setupSeparatorStyle(separatorStyle: AndesSeparatorStyle) {
        switch separatorStyle {
        case .none:
            separatorView.backgroundColor = .clear
        case .singleLine:
            separatorView.backgroundColor = UIColor.Andes.gray100
        }

    }
}
