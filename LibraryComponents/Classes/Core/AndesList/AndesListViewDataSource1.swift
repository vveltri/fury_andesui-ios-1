//
//  AndesListViewDataSource1.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import UIKit

class AndesListViewDataSourceSelf: AndesListView, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = dataSource?.andesListView(self, cellForRowAt: indexPath) else {return UITableViewCell()}
        switch customCell.type {
        case .simple:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: self.separatorStyle)
            return cell
        case .chevron:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListCevronViewCell") as! AndesListCevronViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: self.separatorStyle)
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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.numberOfRows(inSection: indexPath.section) - 1 <= indexPath.row {
            let cell = cell as! AndesListSimpleViewCell
            cell.setupSeparatorStyle(separatorStyle: .none)
        }
    }
}
