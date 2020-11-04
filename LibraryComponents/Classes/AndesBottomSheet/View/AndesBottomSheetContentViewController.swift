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

    var scrollView: UIScrollView?

    private let grabView = AndesBottomSheetGrab()

    private let headerContentView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

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
        setupScrollView()
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
        headerContentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(headerContentView)
    }

    private func setupContent() {
        headerContentView.addArrangedSubview(grabView)
        headerContentView.addArrangedSubview(titleBar)

        viewController.willMove(toParent: self)
        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)

        viewController.view.layoutIfNeeded()
    }

    private func setupScrollView() {
        // Attempt to find scrollview in view or first level subviews
        if let scrollView = viewController.view as? UIScrollView {
            self.scrollView = scrollView
        } else {
            self.scrollView = viewController.view.subviews
                .first(where: { $0 is UIScrollView }) as? UIScrollView
        }
    }

    private func calculatePreferredContentSize() {
        let currentSize = preferredContentSize
        let targetSize = CGSize(width: view.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let headerSize = headerContentView.systemLayoutSizeFitting(targetSize)
        let contentSize = calculateContentSize()
        let newSize = CGSize(width: view.bounds.width, height: headerSize.height + contentSize.height)
        if newSize != currentSize {
            preferredContentSize = newSize
        }
    }

    private func calculateContentSize() -> CGSize {
        if let internalScrollView = scrollView {
            return internalScrollView.contentSize
        }
        return viewController.view.bounds.size
    }

    private func setupCornerRadius() {
        view.clipsToBounds = true
        view.setCornerRadius(cornerRadius: Constants.cornerRadius, roundedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
    }
}
