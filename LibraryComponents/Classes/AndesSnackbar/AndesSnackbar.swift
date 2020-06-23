//
//  AndesSnackbar.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

/// It is a short message that can be displayed for a defined time or require user action.
/// It always appears at the bottom of the screen above any content. Snackbars disappear automatically.
@objc public class AndesSnackbar: UIView {

    internal var contentView: AndesSnackbarView!

    /// Text shown in Snackbar
    @objc public var text: String = "" {
        didSet {
            self.updateContentView()
        }
    }

    /// Snackbars disappear automatically after this value in seconds.
    /// By default the duration is `normal` (6 seconds)
    @objc public var duration: AndesSnackbarDuration = .normal {
        didSet {
            self.updateContentView()
        }
    }

    /// Snackbar can be shown for different types of feedback.
    /// To enforce the kind of feedback we use different colors.
    @objc public var type: AndesSnackbarType = .neutral {
        didSet {
            self.updateContentView()
        }
    }

    /// Snackbar can show an action button, use this property to set the title and callback for that action
    @objc public var action: AndesSnackbarAction? = nil {
        didSet {
            self.updateContentView()
        }
    }

    /// Show the Snackbar at the top view controller.
    public func show() {
        let manager = AndesSnackbarManager.sharedInstance
        manager.show(snackbar: self)
    }

    /// Margin between superview and the Snackbar when is shown
    internal let snackbarMargin: CGFloat = 8.0

    /// Timer used internally to dismiss the snackbar after `duration`.
    /// If there is an action and the button is tapped, this timer is invalidated and the snackbar dismissed.
    internal weak var timer: Timer?

    internal var leftMarginConstraint: NSLayoutConstraint?
    internal var rightMarginConstraint: NSLayoutConstraint?
    internal var bottomMarginConstraint: NSLayoutConstraint?

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public init(text: String, duration: AndesSnackbarDuration = .normal, type: AndesSnackbarType = .neutral) {
        super.init(frame: .zero)
        self.text = text
        self.duration = duration
        self.type = type
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1 // #000000 10%
        self.layer.shadowOffset = CGSize(width: 0.0, height: 8.0) // y: 8px
        self.layer.shadowRadius = 16 // This is the blur
        self.clipsToBounds = false
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: AndesSnackbarView) {
        self.contentView = newView
        self.contentView.delegate = self
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func updateContentView() {
        let config = AndesSnackbarConfigFactory.provideInternalConfig(from: self)
        contentView.update(withConfig: config)
    }

    private func provideView() -> AndesSnackbarView {
        let config = AndesSnackbarConfigFactory.provideInternalConfig(from: self)
        return AndesSnackbarView(withConfig: config)
    }

    internal func updateButtonsLayout() {
        self.contentView.updateButtonsLayout()
    }
}

extension AndesSnackbar: AndesSnackbarViewDelegate {
    func actionButtonTapped() {
        // Callback to perform the action
        self.action?.callback()

        // Dismiss the snackbar animated
        let manager = AndesSnackbarManager.sharedInstance
        manager.dismissSnackbarAnimated(snackbar: self)
    }
}
