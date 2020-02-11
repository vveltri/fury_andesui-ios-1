//
//  AndesMessageShowcaseViewController.swift
//  AndesUI-demoapp
//
//  Created by Nicolas Rostan Talasimov on 2/6/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI
class AndesMessageShowcaseViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!

    let controllers = [MessageViewController(), MessageObjCViewController()]
    var pageController: UIPageViewController!

    fileprivate func setupPageControl() {
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = AndesStyleSheetManager.styleSheet.brandColor
        pageControl.numberOfPages = controllers.count
    }

    fileprivate func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        pageController.setViewControllers([controllers.first!], direction: .forward, animated: true, completion: nil)
        containerView.addSubview(pageController.view)
        pageController.view.pinTo(view: self.containerView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "AndesMessage"
        setupPageController()
        containerView.bringSubview(toFront: pageControl)
        setupPageControl()
    }
}

extension AndesMessageShowcaseViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let current = controllers.index(of: viewController)!
        return current == 0 ? nil : controllers[current -    1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let current = controllers.index(of: viewController)!
        return current + 1 == controllers.count ? nil : controllers[current + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else {return}
        let current = controllers.index(of: (pageViewController.viewControllers?.first!)!)!
        pageControl.currentPage = current
    }
}
