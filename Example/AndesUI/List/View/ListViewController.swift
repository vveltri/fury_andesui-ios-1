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

    @IBOutlet weak var andesList: AndesList!

    var titleArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        andesList.delegate = self
        andesList.dataSource = self
        andesList.separatorStyle = .singleLine
        andesList.listType = "simple"

        titleArray = ["AndesList 1 -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell",
                      "AndesList 1 -- Andes Default Cell"]

        andesList.numberOfRows = titleArray?.count ?? 0

        andesList.reloadData()
    }

}

extension ListViewController: AndesListDelegate {
    func andesList(_ listView: AndesList, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath row: \(indexPath.row)")
    }
}

extension ListViewController: AndesListDataSource {
    func andesList(_ listView: AndesList, cellForRowAt indexPath: IndexPath) -> AndesListCell {

        let thumbnail = AndesThumbnail(hierarchy: .defaultHierarchy, type: .icon, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)

        let simpleCell = AndesSimpleCell(withTitle: titleArray?[indexPath.row] ?? "",
                                             size: .medium,
                                             subTitle: "Descripción--Descripción--Descripción--Descripción",
                                             thumbnail: thumbnail)

        AndesChevronCell()

        return simpleCell
    }
}
