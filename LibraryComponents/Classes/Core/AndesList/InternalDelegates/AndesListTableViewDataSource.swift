//
//  TableViewDataSource.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

internal class AndesListTableViewDataSource: NSObject, UITableViewDataSource {

    var listProtocol: AndesListProtocol

    init(listProtocol: AndesListProtocol) {
        self.listProtocol = listProtocol
        super.init()
    }

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return listProtocol.numberOfSections()
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProtocol.getNumberOfRows()
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = listProtocol.cellForRowAt(indexPath: indexPath)
        switch customCell.type {
        case .simple:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListSimpleViewCell") as! AndesListSimpleViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell
        case .chevron:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AndesListCevronViewCell") as! AndesListCevronViewCell
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell
        default:
            return UITableViewCell()
        }
    }
}
