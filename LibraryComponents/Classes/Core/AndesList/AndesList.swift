//
//  AndesList.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import Foundation

@objc public class AndesList: UIView {

    /// Set the delegate to use own methods
    @objc public weak var delegate: AndesListDelegate?

    /// Set the dataSource to use own methods
    @objc public weak var dataSource: AndesListDataSource?

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
    private var dataSourceSelf: AndesListTableViewDataSource?
    private var delegateSelf: AndesListTableViewDelegate?
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
        dataSourceSelf = AndesListTableViewDataSource(listProtocol: self)
        delegateSelf = AndesListTableViewDelegate(listProtocol: self)
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
extension AndesList: AndesListProtocol {

    func cellForRowAt(indexPath: IndexPath) -> AndesListCell {
        guard let customCell = dataSource?.andesList(self, cellForRowAt: indexPath), customCell.type == listAllowedType else {
            fatalError("Cell type not allowed, should be \(listAllowedType.toString()) type")
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
        self.delegate?.andesList?(self, didSelectRowAt: indexPath)
    }
}
