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

    @objc public var separatorStyle: AndesSeparatorStyleListView = .none

    // TODO
    var numberOfSection: Int = 1

    @objc public func reloadData() {
        self.tableView.reloadData()
    }

    private var tableView: UITableView = UITableView()
    private var dataSourceSelf: AndesListViewTableViewDataSource?
    private var delegateSelf: AndesListViewTableViewDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    init() {
        super.init(frame: .zero)
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
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}

extension AndesListView: AndesListViewProtocol {

    func cellForRowAt(indexPath: IndexPath) -> AndesListViewCell {
        guard let customCell = dataSource?.andesListView(self, cellForRowAt: indexPath) else {return AndesListViewCell()}
        return customCell
    }

    func numberOfSections() -> Int {
        return numberOfSection
    }

    func getNumberOfRows() -> Int {
        return numberOfRows
    }

    func getSeparatorStyle() -> AndesSeparatorStyleListView {
        return self.separatorStyle
    }

    func didSelectRowAt(indexPath: IndexPath) {
        self.delegate?.andesListView?(self, didSelectRowAt: indexPath)
    }
}
