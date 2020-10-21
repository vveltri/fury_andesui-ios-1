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

    @objc public var numberOfRows: NSNumber? {
        get {
            return _numberOfRows as NSNumber?
        }
        set(newNumber) {
            _numberOfRows = newNumber?.intValue
        }
    }

    @objc public var numberOfSection: NSNumber?

    @objc public func reloadData() {
        self.tableView.reloadData()
    }

    private var tableView: UITableView = UITableView()
    private var _numberOfRows: Int?

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
        tableView.register(UINib(nibName: "AndesListDefaultViewCell", bundle: AndesBundle.bundle()), forCellReuseIdentifier: "AndesListDefaultViewCell")
        tableView.register(UINib(nibName: "AndesListLeftViewCell", bundle: AndesBundle.bundle()), forCellReuseIdentifier: "AndesListLeftViewCell")
        drawContentView()
    }

    private func drawContentView() {
        self.tableView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.height)
        addSubview(self.tableView)
        leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension AndesListView: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate?.andesListView?(didSelectRowAt: indexPath)
    }

}

extension AndesListView: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection?.intValue ?? 0
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows?.intValue ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = dataSource?.tableView(self, cellForRowAt: indexPath) else {return UITableViewCell()}
        switch customCell.type {
        case .andesDefault:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListDefaultViewCell") as! AndesListDefaultViewCell
            cell.titleLbl.text = customCell.title
            return cell
        case .andesLeft:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListLeftViewCell") as! AndesListLeftViewCell
            cell.titleLbl.text = customCell.title
            return cell
        default:
            return UITableViewCell()
        }
    }
}
