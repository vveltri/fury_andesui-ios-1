//
//  AndesBottomSheetHeightManager.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import Foundation

protocol AndesBottomSheetHeightManager {
    func getHeight() -> CGFloat
    func setHeight(_ height: CGFloat)
}

protocol AndesBottomSheetHeightConstraintManagerDelegate: class {
    func heightDidChange(_ height: CGFloat)
}

class AndesBottomSheetHeightConstraintManager: AndesBottomSheetHeightManager {
    weak var delegate: AndesBottomSheetHeightConstraintManagerDelegate?

    private var contentControllerViewHeightConstraint: NSLayoutConstraint

    init(constraint: NSLayoutConstraint, delegate: AndesBottomSheetHeightConstraintManagerDelegate) {
        self.contentControllerViewHeightConstraint = constraint
        self.delegate = delegate
    }

    func getHeight() -> CGFloat {
        return contentControllerViewHeightConstraint.constant
    }

    func setHeight(_ height: CGFloat) {
        contentControllerViewHeightConstraint.constant = height
        delegate?.heightDidChange(height)
    }

    func setActive(_ active: Bool) {
        contentControllerViewHeightConstraint.isActive = active
    }
}
