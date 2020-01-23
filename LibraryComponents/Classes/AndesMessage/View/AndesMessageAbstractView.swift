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
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var leftPipeView: UIView!
    @IBOutlet weak var dismissButton: UIButton!

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
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: messageView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: messageView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: messageView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: messageView.bottomAnchor).isActive = true
    }

    func setup() {
        loadNib()
        pinXibViewToSelf()
        updateView()

        self.iconView.image = config.icon
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
        self.bodyLabel.textColor = config.textColor
        self.bodyLabel.font = config.bodyFont
        self.bodyLabel.text = config.bodyText
        self.iconView.tintColor = config.iconColor
        self.iconContainerView.backgroundColor = config.iconBackgroundColor
        if config.isDismissable, let dismissIcon = config.dismissIcon {
            self.dismissButton.isHidden = false
            self.dismissButton.tintColor = config.dismissIconColor
            self.dismissButton.setImage(dismissIcon, for: .normal)
        } else {
            self.dismissButton.isHidden = true
        }
    }
}
