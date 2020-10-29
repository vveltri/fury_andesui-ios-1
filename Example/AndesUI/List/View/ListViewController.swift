//
//  ListViewViewController.swift
//  AndesUI-demoapp
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

class ListViewController: UIViewController {

    @IBOutlet weak var listView: AndesListView!

    var titleArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        listView.delegate = self
        listView.dataSource = self
        listView.separatorStyle = .singleLine
        listView.listType = "chevron"

        titleArray = ["AndesList 1 -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell"]

        listView.numberOfRows = titleArray?.count ?? 0

        listView.reloadData()
    }

}

extension ListViewController: AndesListViewDelegate {
    func andesListView(_ listView: AndesListView, didSelectRowAt indexPath: IndexPath) {
        print("andesListView: \(indexPath.row)")
    }
}

extension ListViewController: AndesListViewDataSource {
    func andesListView(_ listView: AndesListView, cellForRowAt indexPath: IndexPath) -> AndesListViewCell {

        /**********************************************/

//        let cell = AndesSimpleViewCell(withTitle: titleArray?[indexPath.row] ?? "",
//                                             size: .medium,
//                                             subTitle: "Descripción -- Descripción -- Descripción -- Descripción")
        /**********************************************/

        /**********************************************/
        let thumbnail = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)
//
        let cell = AndesChevronViewCell(withTitle: titleArray?[indexPath.row] ?? "",
                                              size: .small,
                                              subTitle: "Descripción de la celda",
                                              thumbnail: thumbnail)
        /**********************************************/

        return cell
    }
}
