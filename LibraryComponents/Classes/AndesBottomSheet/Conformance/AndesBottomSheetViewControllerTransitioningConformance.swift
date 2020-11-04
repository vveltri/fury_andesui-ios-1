//
//  AndesBottomSheetViewControllerTransitioningConformance.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 04/11/2020.
//

import Foundation

class AndesBottomSheetViewControllerTransitioningConformance: NSObject, UIViewControllerTransitioningDelegate {
    open func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AndesBottomSheetPresentingTransitionAnimation()
    }

    open func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AndesBottomSheetDismissingTransitionAnimation()
    }
}
