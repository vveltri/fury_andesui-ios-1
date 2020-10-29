//
//  TableViewDelegate.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation

internal class AndesListViewTableViewDelegate: NSObject, UITableViewDelegate {

    var listView: AndesListViewProtocol

    init(listView: AndesListViewProtocol) {
        self.listView = listView
        super.init()
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        listView.didSelectRowAt?(indexPath: indexPath)
    }

    internal func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.numberOfRows(inSection: indexPath.section) - 1 <= indexPath.row {
            let cell = cell as! AndesListSimpleViewCell
            cell.setupSeparatorStyle(separatorStyle: .none)
        }
    }
}
