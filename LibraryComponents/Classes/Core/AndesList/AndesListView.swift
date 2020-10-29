//
//  AndesListView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import Foundation

@objc public class AndesListView: UIView {

    @objc public weak var delegate: AndesListViewDelegate?
    @objc public weak var dataSource: AndesListViewDataSource?

    @objc public var title: String?

    @objc public var numberOfRows: Int = 0

    @objc public var separatorStyle: AndesSeparatorStyle = .none

    @IBInspectable public var listType: String {
        set(val) {
            self.listAllowedType = AndesCellType.checkValidEnum(property: listType, key: val)
        }
        get {
            return self.listAllowedType.toString()
        }
    }

    // TODO
    var numberOfSection: Int = 1

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

    init(type: String) {
        super.init(frame: .zero)
        listAllowedType = AndesCellType.checkValidEnum(property: type, key: type)
        setup()
    }

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
