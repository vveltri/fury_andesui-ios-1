//
//  AndesDropdown.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

@objc public class AndesDropdown: UIView {

    private var contentView: AndesDropdownView!

    /// Set the trigger type, default is formDropdown
    @objc public var triggerType: AndesDropdownTrigger {
        didSet {
            self.updateContentView()
        }
    }

    /// Set the menu type, default is bottomsheet
    @objc public var menuType: AndesDropdownMenu {
        didSet {
            self.setContentView()
        }
    }

    /// Set the delegate
    @objc public weak var delegate: AndesDropdownDelegate?

    private let rootViewController = UIApplication.shared.keyWindow?.rootViewController

    init() {
        self.triggerType = AndesDropdownTrigger()
        self.menuType = AndesDropdownMenu(rows: [])
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.triggerType = AndesDropdownTrigger()
        self.menuType = AndesDropdownMenu(rows: [])
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func getConfig(isSelected: Bool) -> AndesDropdownViewConfig {
        return AndesDropdownViewConfigFactory.provide(from: self, isSelected: isSelected)
    }

    private func provideView() -> AndesDropdownAbstractView {
        return AndesDropdownDefaultView(withConfig: getConfig(isSelected: false))
    }

    private func drawContentView(with newView: AndesDropdownAbstractView) {
        self.contentView = newView
        self.contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        contentView.update(withConfig: getConfig(isSelected: false))
    }

    private func updateSelectedContentView() {
        contentView.update(withConfig: getConfig(isSelected: true))
    }

    private func setContentView() {
        guard menuType.rows.count != 0 else {
            fatalError("You should provided the rows")
        }
        switch self.triggerType.type {
        case .standalone:
            contentView.text = menuType.rows[0].title
        case .formDropdown:
            contentView.text = ""

        }
    }
}

extension AndesDropdown: AndesDropdownViewDelegate {
    func didSelectAndesTextField() {
        updateSelectedContentView()
        openMenuType()

    }

    func openMenuType() {
        switch self.menuType.type {
        case .botttomSheet:
            self.openSheet()
        case .floatingMenu:
            break
        }
    }
}

extension AndesDropdown {
    private func openSheet() {
        let sheet = AndesBottomSheetViewController(rootViewController: configViewController())
        rootViewController?.present(sheet, animated: true)
    }

    func configViewController() -> UIViewController {
        let viewController = AndesDropdownBottomSheetViewController(nibName: "AndesDropdownBottomSheetViewController",
                                                                    bundle: AndesDropdownBundle.bundle())
        viewController.delegate = self
        viewController.configController(menuCellType: menuType.rows,
                                        numberOfLines: self.menuType.numberOfLines,
                                        separatorStyle: (self.menuType as? DropdownBottomSheetMenu)?.separatorStyle,
                                        selectionStyle: (self.menuType as? DropdownBottomSheetMenu)?.selectionStyle)
        return viewController
    }
}

extension AndesDropdown: AndesDropdownBottomSheetViewDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        rootViewController?.dismiss(animated: true)
        self.contentView.text = menuType.rows[indexPath.row].title
        delegate?.didSelectRowAt(indexPath: indexPath)
    }

    func dismiss() {
        self.updateContentView()
    }
}
