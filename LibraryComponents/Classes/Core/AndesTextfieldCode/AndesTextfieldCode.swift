//
//  AndesTextfieldCode.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

@objc public class AndesTextfieldCode: UIView {

    internal var contentView: AndesTextfieldCodeProtocol?

    @objc public var label: String? = "" {
        didSet {
            // update
        }
    }

    @objc public var helpLabel: String? = "" {
        didSet {
            // update
        }
    }

    @objc public var style: String = "" {
        didSet {
            // update
        }
    }

    @objc public init(label: String?, helpLabel: String?, style: String) {
        super.init(frame: .zero)
        self.label = label
        self.helpLabel = helpLabel
        self.style = style
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AndesTextfieldCode {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        drawContentView(with: provideView())
    }

    func drawContentView(with newView: AndesTextfieldCodeProtocol) {
        contentView = newView
        if let contentView = contentView {
//            backgroundColor = .brown
            addSubview(contentView)
            leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        }
    }

    func provideView() -> AndesTextfieldCodeProtocol {
        let config = AndesTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        switch config.style {
        case "threesome":
            return AndesTextfieldCodeThreesome(config: config)
        case "foursome":
            return AndesTextfieldCodeFoursome(config: config)
        default:
            return AndesTextfieldCodeThreeByThree(config: config)
        }
    }
}
