//
//  AndesMessageView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/14/20.
//

import UIKit

class AndesMessageAbstractView: UIView, AndesMessageView {
    weak var delegate: AndesMessageViewDelegate?

    @IBOutlet var messageView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var leftPipeView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var titleToDismissConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleToSafeAreaConstraint: NSLayoutConstraint!

    var config: AndesMessageViewConfig
    init(withConfig config: AndesMessageViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesMessageViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesMessageViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(messageView)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: messageView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: messageView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: messageView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: messageView.bottomAnchor).isActive = true
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()

        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        messageView.clipsToBounds = true
    }

    @IBAction func dismissPressed(_ sender: Any) {
        self.delegate?.dismissTapped()
    }

    /// Override this method on each Message View to setup its unique components
    func updateView() {
        self.backgroundColor = config.backgroundColor
        self.leftPipeView.backgroundColor = config.pipeColor

        self.bodyLabel.setAndesStyle(style: config.bodyStyle)
        self.bodyLabel.text = config.bodyText

        self.iconView.tintColor = config.iconColor
        if let icon = config.icon {
            AndesIconsProvider.loadIcon(name: icon, placeItInto: self.iconView)
        }
        self.iconContainerView.backgroundColor = config.iconBackgroundColor

        self.titleLabel.text = config.titleText

        if config.titleText == nil || config.titleText!.isEmpty {
            titleLabel.isHidden = true
        } else {
            self.titleLabel.setAndesStyle(style: config.titleStyle)
            self.titleLabel.text = config.titleText
            self.titleLabel.isHidden = false
        }

        if config.isDismissable, let iconName = config.dismissIconName {
            self.dismissButton.isHidden = false
            self.titleToDismissConstraint.priority = .required
            self.titleToSafeAreaConstraint.priority = .defaultLow
            self.dismissButton.tintColor = config.dismissIconColor
            AndesIconsProvider.loadIcon(name: iconName) {
                self.dismissButton.setImage($0, for: .normal)
            }
            self.dismissButton.accessibilityLabel = "Cerrar".localized()
        } else {
            self.titleToDismissConstraint.priority = .defaultLow
            self.titleToSafeAreaConstraint.priority = .required
            self.dismissButton.isHidden = true
        }
    }
}
