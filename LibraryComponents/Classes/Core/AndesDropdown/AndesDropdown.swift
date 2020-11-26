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
    @objc public var triggerType: AndesDropdownTriggerType = .formDropdown {
        didSet {
            self.updateContentView()
            self.setContentView()
        }
    }

    /// Set the menu type, default is bottomsheet
    @objc public var menuType: AndesDropdownMenuType = .bottomSheet {
        didSet {
            self.updateContentView()
        }
    }

    /// Set the textfield title
    @objc public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Set the bottom sheet title
    @objc public var titleBottomSheet: String?

    /// Set the aligment bottom sheet title, default is left
    @objc public var aligmentTitleBottomSheet: NSTextAlignment = .left

    /// Set the cell type
    @objc public var menuCellType: [AndesDropDownMenuCellType]? {
        didSet {
            self.updateContentView()
            self.setContentView()
        }
    }

    /// Set the delegate
    @objc public weak var delegate: AndesDropDownDelegate?

    /// Set the number of lines for the list, default 0
    @objc public var numberOfLines: Int = 0

    /// Set the separator style, default value .none
    @objc public var separatorStyle: AndesSeparatorStyle = .none

    /// Set the selection style, default value .default
    @objc public var selectionStyle: AndesSelectionStyle = .defaultStyle

    /// Set the textfield counter
    @IBInspectable public var counter: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    /// Set the textfield placeholder
    @IBInspectable public var placeholder: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Set the textfield text and returns the current textfield text
    @IBInspectable public var text: String {
        get {
            return contentView.text
        }
        set {
            contentView.text = newValue
        }
    }

    private let rootViewController = UIApplication.shared.keyWindow?.rootViewController

    init() {
        super.init(frame: .zero)
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

    private func getConfig(isSelected: Bool) -> AndesDropdownViewConfig {
        return AndesDropdownViewConfigFactory.provide(from: self, isSelected: isSelected)
    }

    private func provideView() -> AndesDropdownAbstractView {
        return AndesDropdownDefaultView(withConfig: getConfig(isSelected: false),
                                        firstItem: menuCellType?[0].title ?? "")
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
        if triggerType == .standalone {
            guard let title = menuCellType?[0].title else { return }
            contentView.text = title
        } else {
            contentView.text = ""
        }
    }
}

extension AndesDropdown: AndesDropdownViewDelegate {
    func didSelectAndesTextField() {
        updateSelectedContentView()
        self.openSheet()
    }
}

extension AndesDropdown {
    private func openSheet() {
        let viewController = AndesDropdownBottomSheetViewController(nibName: "AndesDropdownBottomSheetViewController",
                                                                    bundle: AndesBundle.bundle())
        viewController.delegate = self
        viewController.configController(menuCellType: self.menuCellType,
                                        cellSize: .medium,
                                        numberOfLines: self.numberOfLines,
                                        separatorStyle: self.separatorStyle,
                                        selectionStyle: self.selectionStyle)

        let sheet = AndesBottomSheetViewController(rootViewController: viewController)
        sheet.titleBar.text = self.titleBottomSheet
        sheet.titleBar.textAlignment = self.aligmentTitleBottomSheet
        rootViewController?.present(sheet, animated: true)
    }
}

extension AndesDropdown: AndesDropdownBottomSheetViewDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        rootViewController?.dismiss(animated: true)
        self.contentView.text = menuCellType?[indexPath.row].title ?? ""
        delegate?.didSelectRowAt(indexPath: indexPath)
    }

    func dismiss() {
        self.updateContentView()
    }
}
