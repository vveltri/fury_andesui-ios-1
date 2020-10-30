//
//  AndesBottomSheetContentViewController.swift
//  AndesUI
//
//  Created by Tomi De Lucca on 29/10/2020.
//

import UIKit

private enum Constants {
    static let cornerRadius: CGFloat = 6.0
}

class AndesBottomSheetContentViewController: UIViewController {

    private(set) var viewController: UIViewController
    private(set) var titleBar = AndesBottomSheetTitleBar()

    private let grabView = AndesBottomSheetGrab()
    private let contentView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    init(viewController: UIViewController) {
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        setupContentView()
        setupContent()
        setupCornerRadius()
        setupTitle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculatePreferredContentSize()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calculatePreferredContentSize()
    }

    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func setupContent() {
        contentView.addArrangedSubview(grabView)
        contentView.addArrangedSubview(titleBar)

        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    private func setupTitle() {

    }

    private func calculatePreferredContentSize() {
        let targetSize = CGSize(width: view.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let currentSize = preferredContentSize
        let newSize = view.systemLayoutSizeFitting(targetSize)
        if newSize != currentSize { preferredContentSize = newSize }
    }

    private func setupCornerRadius() {
        view.clipsToBounds = true
        view.setCornerRadius(cornerRadius: Constants.cornerRadius, roundedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
}
