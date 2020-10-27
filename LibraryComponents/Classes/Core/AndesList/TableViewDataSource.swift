//
//  TableViewDataSource.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

internal class AndesListTableViewDataSource: NSObject, UITableViewDataSource {

    var listView: AndesListViewProtocol

    init(listView: AndesListViewProtocol) {
        self.listView = listView
        super.init()
    }

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return listView.numberOfSections()
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listView.getNumberOfRows()
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = listView.cellForRowAt(indexPath: indexPath)
        switch customCell.type {
        case .simple:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listView.getSeparatorStyle())
            return cell
        case .chevron:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListCevronViewCell") as! AndesListCevronViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listView.getSeparatorStyle())
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
}
