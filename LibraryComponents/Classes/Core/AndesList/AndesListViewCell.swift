//
//  AndesListViewCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import UIKit

@objc public class AndesListViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var thumbnailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumbnailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var spaceThumbnailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopThumbnailConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomThumbnailConstraint: NSLayoutConstraint!

    public var title: String = String()
    public var subTitle: String = String()
    public var type: AndesCellType?
    public var fontStyle: AndesFontStyle = AndesFontStyle(textColor: .black,
                                                          font: UIFont.boldSystemFont(ofSize: 16),
                                                          lineSpacing: 2)
    public var fontSubTitleStyle: AndesFontStyle = AndesFontStyle(textColor: .black,
                                                                     font: UIFont.boldSystemFont(ofSize: 16),
                                                                     lineSpacing: 2)
    public var paddingLeftCell: CGFloat = 0
    public var paddingRightCell: CGFloat = 0
    public var paddingTopCell: CGFloat = 0
    public var paddingBottomCell: CGFloat = 0
    public var subTitleHeight: CGFloat = 0
    public var separatorHeight: CGFloat = 0
    public var heightConstraint: CGFloat = 0
    public var titleHeight: CGFloat = 0
    public var chevron: String?
    public var chevronSize: CGFloat? = 0
    public var thumbnailLeft: UIImage?
    public var thumbnailSize: CGFloat? = 0
    public var separatorThumbnailWidth: CGFloat? = 0
    public var paddingTopThumbnail: CGFloat? = 0
    public var paddingBottomThumbnail: CGFloat? = 0
    public var separatorChevronWidth: CGFloat? = 0
    public var paddingTopChevron: CGFloat? = 0
    public var paddingBottomChevron: CGFloat? = 0

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
    }
}
