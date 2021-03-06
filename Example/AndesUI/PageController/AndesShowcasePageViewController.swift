//
//  AndesShowcasePageViewController.swift
//  AndesUI-demoapp
//
//  Created by Martin Damico on 13/03/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class AndesShowcasePageViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    var controllers: [UIViewController]

    var pageController: UIPageViewController!

    let analyticsHelper = AnalyticsHelper()

    init(controllers: [UIViewController]) {
        self.controllers = controllers
        super.init(nibName: "AndesShowcasePageViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPageControl() {
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = AndesStyleSheetManager.styleSheet.brandColor500
        pageControl.numberOfPages = controllers.count
    }

    private func setupPageController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self

        pageController.willMove(toParentViewController: self)
        addChildViewController(pageController)
        containerView.addSubview(pageController.view)
        pageController.view.pinTo(view: self.containerView)
        pageController.didMove(toParentViewController: self)

        pageController.setViewControllers([controllers.first!], direction: .forward, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
        containerView.bringSubview(toFront: pageControl)
        setupPageControl()

        if #available(iOS 11.0, *) {} else {
            // iOS <= 10 fix https://forums.developer.apple.com/thread/87329
            guard let topBarHeight = self.navigationController?.navigationBar.frame.height else {
                return
            }
            let padding: CGFloat = 15
            topConstraint.constant = padding + topBarHeight
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard
            let componentName = self.title,
            let currentVc = (controllers.first?.nibName != nil ) ? controllers.first?.nibName : controllers.first?.title else { return }

        analyticsHelper.createPathWith(componentName, view: currentVc)
    }
}

extension AndesShowcasePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {
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

        guard let title = self.title,
              let pageContentViewController = pageViewController.viewControllers!.first,
              let currentVc = (pageContentViewController.nibName != nil ) ? pageContentViewController.nibName : pageContentViewController.title else { return }

        analyticsHelper.createPathWith(title, view: currentVc)
    }
}
