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
    @IBOutlet weak var radioButtonSimple: AndesRadioButton!
    @IBOutlet weak var radioButtonChevron: AndesRadioButton!
    @IBOutlet weak var radioButtonIcon: AndesRadioButton!
    @IBOutlet weak var radioButtonThumbnail: AndesRadioButton!
    @IBOutlet weak var titleTxt: AndesTextField!
    @IBOutlet weak var numberOfLinesTitle: UITextField!
    @IBOutlet weak var descriptionTxt: AndesTextField!
    @IBOutlet weak var selection: UISegmentedControl!

    let icon = AndesThumbnail(hierarchy: .defaultHierarchy, type: .icon, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)
    let thumbnail = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)
    var cell: AndesListCell!
    var size: AndesListSize?
    var image: AndesThumbnail?
    var numberOfLines: Int?

    var titleArray: [String]?
    var simpleCellSelected: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        self.valuesDefault()

        radioButtonSimple.setRadioButtonTapped(callback: didTapIdle(radiobutton:))
        radioButtonChevron.setRadioButtonTapped(callback: didTapIdle(radiobutton:))
        radioButtonIcon.setRadioButtonTapped(callback: didTapIdle(radiobutton:))
        radioButtonThumbnail.setRadioButtonTapped(callback: didTapIdle(radiobutton:))

        andesList.delegate = self
        andesList.dataSource = self
        andesList.separatorStyle = .singleLine
        andesList.numberOfRows = 15

        buildCell()
    }

    @IBAction func update() {
        buildCell()
        andesList.reloadData()
    }

    @IBAction func valuesDefault() {
        self.titleTxt.text = "Title default"
        self.descriptionTxt.text = "Description default"
        self.size = .medium
        self.image = nil
        self.numberOfLines = 0
        andesList.listType = "simple"
        simpleCellSelected = true
        selection.selectedSegmentIndex = 1
        self.numberOfLinesTitle.text = "0"
        self.radioButtonIcon.status = .unselected
        self.radioButtonThumbnail.status = .unselected
        self.radioButtonSimple.status = .selected
        self.radioButtonChevron.status = .unselected
        buildCell()
        andesList.reloadData()
    }

    func didTapIdle(radiobutton: AndesRadioButton) {
        if radiobutton == self.radioButtonSimple {
            self.radioButtonSimple.status = .selected
            self.radioButtonChevron.status = .unselected
            simpleCellSelected = true
            andesList.listType = "simple"
        } else if radiobutton == self.radioButtonChevron {
            self.radioButtonSimple.status = .unselected
            self.radioButtonChevron.status = .selected
            simpleCellSelected = false
            andesList.listType = "chevron"
        } else if radiobutton == self.radioButtonIcon {
            self.radioButtonIcon.status = .selected
            self.radioButtonThumbnail.status = .unselected
            self.image = icon
        } else if radiobutton == self.radioButtonThumbnail {
            self.radioButtonIcon.status = .unselected
            self.radioButtonThumbnail.status = .selected
            self.image = thumbnail
        }
    }

    func buildCell() {
        if simpleCellSelected {
            cell = AndesSimpleCell(withTitle: getTitleRow(),
                                   size: self.size,
                                   subTitle: self.descriptionTxt.text,
                                   thumbnail: self.image,
                                   numberOfLines: self.getNumberOfLines())
        } else {
            cell = AndesChevronCell(withTitle: getTitleRow(),
                                    size: self.size,
                                    subTitle: self.descriptionTxt.text,
                                    thumbnail: self.image,
                                    numberOfLines: self.getNumberOfLines())
        }
    }

    func getTitleRow() -> String {
        if self.titleTxt.text.isEmpty {
            return "Title default"
        }
        return self.titleTxt.text
    }

    func getNumberOfLines() -> Int {
        if let lines = Int(self.numberOfLinesTitle.text ?? "0") {
            return lines
        }
        return 0
    }

    @IBAction func valueChangeSegmented() {
        if selection.selectedSegmentIndex == 0 {
            size = .small
        } else if selection.selectedSegmentIndex == 1 {
            size = .medium
        } else {
            size = .large
        }
    }
}

extension ListViewController: AndesListDelegate {
    func andesList(_ listView: AndesList, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath row: \(indexPath.row)")
    }
}

extension ListViewController: AndesListDataSource {
    func andesList(_ listView: AndesList, cellForRowAt indexPath: IndexPath) -> AndesListCell {
        return self.cell
    }
}
