//
//  AndesListView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import Foundation

@objc public class AndesListView: UIView {

    /// Set the delegate to use own methods
    @objc public weak var delegate: AndesListViewDelegate?

    /// Set the dataSource to use own methods
    @objc public weak var dataSource: AndesListViewDataSource?

    /// Set the number or rows, default value 0
    @objc public var numberOfRows: Int = 0

    /// Set the number of section
    var numberOfSection: Int = 1

    /// Set the separator style, default value .none
    @objc public var separatorStyle: AndesSeparatorStyle = .none

    /// Set the list type, default value simple
    @IBInspectable public var listType: String {
        set(val) {
            self.listAllowedType = AndesCellType.checkValidEnum(property: listType, key: val)
        }
        get {
            return self.listAllowedType.toString()
        }
    }

    @objc public func reloadData() {
        self.tableView.reloadData()
    }

    private var tableView: UITableView = UITableView()
    private var dataSourceSelf: AndesListViewTableViewDataSource?
    private var delegateSelf: AndesListViewTableViewDelegate?
    private var listAllowedType: AndesCellType = .simple

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public init(type: String) {
        super.init(frame: .zero)
        listAllowedType = AndesCellType.checkValidEnum(property: type, key: type)
        setup()
    }

    /// Setup delegates and register UITableViewCell on the UITableView
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        dataSourceSelf = AndesListViewTableViewDataSource(listView: self)
        delegateSelf = AndesListViewTableViewDelegate(listView: self)
        self.tableView.delegate = delegateSelf
        self.tableView.dataSource = dataSourceSelf
        self.tableView.separatorStyle = .none
        self.tableView.separatorInset.left = UIScreen.main.bounds.width
        tableView.register(UINib(nibName: "AndesListSimpleViewCell",
                                 bundle: AndesBundle.bundle()),
                           forCellReuseIdentifier: "AndesListSimpleViewCell")
        tableView.register(UINib(nibName: "AndesListCevronViewCell",
                                 bundle: AndesBundle.bundle()),
                           forCellReuseIdentifier: "AndesListCevronViewCell")
        drawContentView()
    }

    private func drawContentView() {
        addSubview(self.tableView)
        self.tableView.pinToSuperview()
    }
}

/// Use (UITableViewDelegate and UITableViewDatasource) in a independent protocol
extension AndesListView: AndesListViewProtocol {

    func cellForRowAt(indexPath: IndexPath) -> AndesListViewCell {
        guard let customCell = dataSource?.andesListView(self, cellForRowAt: indexPath), customCell.type == listAllowedType else {
            fatalError("List type not allowed")
        }
        return customCell
    }

    func numberOfSections() -> Int {
        return numberOfSection
    }

    func getNumberOfRows() -> Int {
        return numberOfRows
    }

    func getSeparatorStyle() -> AndesSeparatorStyle {
        return self.separatorStyle
    }

    func didSelectRowAt(indexPath: IndexPath) {
        self.delegate?.andesListView?(self, didSelectRowAt: indexPath)
    }
}
