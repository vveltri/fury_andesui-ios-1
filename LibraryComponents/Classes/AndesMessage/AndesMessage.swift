//
//  AndesMessage.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/13/20.
//

import UIKit

@objc public class AndesMessage: UIView {
    internal var view: AndesMessageView!
    /// returns the current hierarchy
    public private(set) var hierarchy: AndesMessageHierarchy = .loud

    /// returns the current type
    public private(set) var type: AndesMessageType = .highlight

    /// returns the current title
    public private(set) var title: String?

    /// returns the current message body
    public private(set) var body: String = ""

    /// returns true if the message is dismissable by user
    public private(set) var isDismissable: Bool = false

    private var dismissHandler: ((_ message: AndesMessage) -> Void)?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(hierarchy: AndesMessageHierarchy, type: AndesMessageType, title: String, body: String) {
        super.init(frame: .zero)
        self.title = title
        self.body = body
        self.hierarchy = hierarchy
        self.type = type
        setup()
    }

    private func drawContentView() {
        self.view = provideView()
        view.delegate = self
        addSubview(view)
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView()
    }

    private func updateContentView() {
        let config = AndesMessageViewConfigFactory.provideConfig(hierarchy: self.hierarchy, type: self.type, title: self.title, body: self.body, isDismissable: self.isDismissable)
        view.update(withConfig: config)
    }

    /// Sets the title of the AndesMessage
    /// - Parameter title: string
    @objc @discardableResult public func setTitle(_ title: String) -> AndesMessage {
        self.title = title
        updateContentView()
        return self
    }

    /// Sets the body of the AndesMessage
    /// - Parameter body: message body
    @objc @discardableResult public func setBody(_ body: String) -> AndesMessage {
        self.body = body
        updateContentView()
        return self
    }

    /// Sets the style of the message
    /// - Parameter hierarchy: options defined in AndesMessageHierarchy
    @objc @discardableResult public func setHierarchy(_ hierarchy: AndesMessageHierarchy) -> AndesMessage {
        self.hierarchy = hierarchy
        updateContentView()
        return self
    }

    /// Sets the colors/icon of the message
    /// - Parameter type: defined in AndesMessageType
    @objc @discardableResult public func setType(_ type: AndesMessageType) -> AndesMessage {
        self.type = type
        updateContentView()
        return self
    }

    /// shows or hides the dismiss button
    @objc @discardableResult public func setDismissable(_ dismissable: Bool) -> AndesMessage {
          self.isDismissable = dismissable
          updateContentView()
          return self
      }

    /// handler to trigger when the user dismisses the message
    /// - Parameter handler: dismiss handler
    @objc @discardableResult public func onDismiss(_ callback: ((_ message: AndesMessage) -> Void)?) -> AndesMessage {
        self.dismissHandler = callback
        return self
    }

    /// Should return a view depending on which message variant is selected
    private func provideView() -> AndesMessageView {
        let config = AndesMessageViewConfigFactory.provideConfig(hierarchy: self.hierarchy, type: self.type, title: self.title, body: self.body, isDismissable: self.isDismissable)
        return AndesMessageDefaultView(withConfig: config)
    }
}

extension AndesMessage: AndesMessageViewDelegate {
    func dismissTapped() {
        self.isHidden = true
        dismissHandler?(self)
    }
}
