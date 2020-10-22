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

    var titleArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        listView.delegate = self
        listView.dataSource = self

        titleArray = ["AndesList 1 -- AndesDefaultCell",
                      "AndesList 1 -- AndesDefaultCell",
                      "AndesList 1 -- AndesDefaultCell"]

        listView.numberOfRows = titleArray?.count ?? 0
        listView.numberOfSection = 1

        listView.reloadData()
    }

}

extension ListViewViewController: AndesListViewDelegate {
    func andesListView(_ listView: AndesListView, didSelectRowAt indexPath: IndexPath) {
        print("andesListView: \(indexPath.row)")
    }
}

extension ListViewViewController: AndesListViewDataSource {
    func andesListView(_ listView: AndesListView, cellForRowAt indexPath: IndexPath) -> AndesListViewCell {
        let cell = AndesDefaultViewCellConfig(withTitle: titleArray?[indexPath.row] ?? "", size: .small)
        return cell
    }
}
