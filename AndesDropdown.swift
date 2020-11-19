//
//  AndesDropdown.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

@objc public class AndesDropdown: UIView {

    private var contentView: AndesDropdownView!

    @objc public var triggerType: AndesDropdownTriggerType = .formDropdown {
        didSet {
            self.updateContentView()
        }
    }
    @objc public var menuType: AndesDropdownMenuType = .bottomSheet {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var label: String? {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var helper: String? {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var counter: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var placeholder: String? {
        didSet {
            self.updateContentView()
        }
    }

    init() {
        super.init(frame: .zero)
        contentView.delegate = self
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func provideView() -> AndesDropdownAbstractView {
        let config = AndesDropdownConfigFactory.provide(from: self)
        return AndesDropdownDefaultView(withConfig: config)
    }

    private func drawContentView(with newView: AndesDropdownAbstractView) {
        self.contentView = newView
        self.contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        let config = AndesDropdownConfigFactory.provide(from: self)
        contentView.update(withConfig: config)
    }
}

extension AndesDropdown: AndesDropdownViewDelegate {
    func didSelectAndesTextField() {
        self.openSheet()
    }
}

extension AndesDropdown {
    private func openSheet() {
        let sheet = AndesBottomSheetViewController(rootViewController: UIViewController())
//        sheet.titleBar.text = configuration.titleEnabled ? "This is a title" : nil
//        sheet.titleBar.textAlignment = randomTextAlignment()
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        rootViewController?.present(sheet, animated: true)
//        present(sheet, animated: true)
    }
}
