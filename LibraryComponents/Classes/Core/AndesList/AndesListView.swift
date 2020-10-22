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

    @objc public var numberOfRows: Int

    @objc public var numberOfSection: Int

    @objc public func reloadData() {
        self.tableView.reloadData()
    }

    private var tableView: UITableView = UITableView()

    required init?(coder: NSCoder) {
        self.numberOfSection = 0
        self.numberOfRows = 0
        super.init(coder: coder)
        setup()
    }

    override public init(frame: CGRect) {
        self.numberOfSection = 0
        self.numberOfRows = 0
        super.init(frame: frame)
        setup()
    }

    init() {
        self.numberOfSection = 0
        self.numberOfRows = 0
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
        case .andesDefault:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListDefaultViewCell") as! AndesListDefaultViewCell
            cell.display(indexPath: indexPath, customCell: customCell)
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
