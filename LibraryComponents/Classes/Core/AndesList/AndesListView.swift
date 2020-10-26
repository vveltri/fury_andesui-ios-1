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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.separatorInset.left = UIScreen.main.bounds.width
        tableView.register(UINib(nibName: "AndesListSimpleViewCell", bundle: AndesBundle.bundle()), forCellReuseIdentifier: "AndesListSimpleViewCell")
        tableView.register(UINib(nibName: "AndesListLeftViewCell", bundle: AndesBundle.bundle()), forCellReuseIdentifier: "AndesListLeftViewCell")
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

extension AndesListView: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate?.andesListView?(self, didSelectRowAt: indexPath)
    }

}

extension AndesListView: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = dataSource?.andesListView(self, cellForRowAt: indexPath) else {return UITableViewCell()}
        switch customCell.type {
        case .simple:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: self.separatorStyle)
            return cell
        case .chevron:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.titleLbl.text = customCell.title
            return cell
        case .radioButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.titleLbl.text = customCell.title
            return cell
        case .checkBox:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.titleLbl.text = customCell.title
            return cell
        default:
            return UITableViewCell()
        }
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.numberOfRows(inSection: indexPath.section) - 1 <= indexPath.row {
            let cell = cell as! AndesListSimpleViewCell
            cell.setupSeparatorStyle(separatorStyle: .none)
        }
    }
}
