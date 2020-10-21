//
//  ListViewViewController.swift
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class ListViewViewController: UIViewController {

    @IBOutlet weak var listView: AndesListView!
    @IBOutlet weak var listView2: AndesListView!

    var titleArray: [String]?
    var titleArray2: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        listView.delegate = self
        listView.dataSource = self

        titleArray = ["AndesList 1 -- AndesListLeftCell",
                      "AndesList 1 -- AndesListLeftCell",
                      "AndesList 1 -- AndesListLeftCell"]

        listView.numberOfRows = NSNumber(nonretainedObject: titleArray?.count)
        listView.numberOfSection = 1

        listView.reloadData()

        listView2.delegate = self
        listView2.dataSource = self

        titleArray2 = ["AndesList 2 -- AndesListLeftCell",
                      "AndesList 2 -- AndesListLeftCell"]

        listView2.numberOfRows = NSNumber(nonretainedObject: titleArray2?.count)
        listView2.numberOfSection = 1
        listView2.reloadData()
    }

}

extension ListViewViewController: AndesListViewDelegate {
    func andesListView(didSelectRowAt indexPath: IndexPath) {
        print("andesListView: \(indexPath.row)")
    }
}

extension ListViewViewController: AndesListViewDataSource {
    func tableView(_ tableView: AndesListView, cellForRowAt indexPath: IndexPath) -> AndesListViewCell {
        let cell = AndesDefaultCell(title: titleArray2?[indexPath.row] ?? "")
        return cell
    }
}
