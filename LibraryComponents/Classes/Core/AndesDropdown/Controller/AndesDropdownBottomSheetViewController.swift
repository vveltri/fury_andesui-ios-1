//
//  AndesDropdownBottomSheetViewController.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 19/11/20.
//

import UIKit

class AndesDropdownBottomSheetViewController: UIViewController {

    @IBOutlet var andesList: AndesList!
    weak var delegate: AndesDropdownBottomSheetViewDelegate?

    var menuCellType: [AndesDropDownMenuCellType]?
    var cell: [AndesSimpleCell] = []
    var cellSize: AndesDropdownCellSize = .medium
    var numberOfLines: Int = 0
    var separatorStyle: AndesSeparatorStyle = .singleLine
    var selectionStyle: AndesSelectionStyle = .defaultStyle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.buildCells()
    }

    func setup() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        andesList.delegate = self
        andesList.dataSource = self
        andesList.separatorStyle = self.separatorStyle
        andesList.selectionStyle = self.selectionStyle
        self.view.heightAnchor.constraint(equalToConstant: andesList.frame.height).isActive = true
        self.view.layoutIfNeeded()
    }

    func buildCells() {
        guard let menuCellType = self.menuCellType else { return }
        cell = AndesDropdownBottomSheetCellFactory.provide(menuCellType: menuCellType,
                                                           size: AndesListSize(rawValue: self.cellSize.rawValue) ?? .medium,
                                                           numberOfLines: self.numberOfLines)
        andesList.reloadData()
    }

    func configController(menuCellType: [AndesDropDownMenuCellType]?,
                          cellSize: AndesDropdownCellSize = .medium,
                          numberOfLines: Int = 0,
                          separatorStyle: AndesSeparatorStyle?,
                          selectionStyle: AndesSelectionStyle?) {

        self.menuCellType = menuCellType
        self.cellSize = cellSize
        self.numberOfLines = numberOfLines
        self.separatorStyle = separatorStyle ?? .singleLine
        self.selectionStyle = selectionStyle ?? .defaultStyle
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.dismiss()
    }
}

extension AndesDropdownBottomSheetViewController: AndesListDelegate {
    func andesList(_ listView: AndesList, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRowAt(indexPath: indexPath)
    }
}

extension AndesDropdownBottomSheetViewController: AndesListDataSource {
    func numberOfSections(_ listView: AndesList) -> Int {
        1
    }

    func andesList(_ listView: AndesList, cellForRowAt indexPath: IndexPath) -> AndesListCell {
        let cell1 = cell[indexPath.row]
        return cell1
    }

    func andesList(_ listView: AndesList, numberOfRowsInSection section: Int) -> Int {
        cell.count
    }
}
