//
//  AndesListTest.swift
//  AndesUI_Tests
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesListTests: QuickSpec {

    var titleArray: [String]?
    var internalAndesList: AndesList?
    var cellType: AndesCellType?
    var thumbnailType: AndesThumbnailType?
    var didSelected: Bool = false
    var icon: AndesThumbnail?
    var thumbnail: AndesThumbnail?

    override func spec() {
        describe("AndesList should draw it's view based on style and size") {
            context("AndesList Implementation") {
                beforeEach {
                    self.icon = AndesThumbnail(hierarchy: .defaultHierarchy, type: .icon, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)
                    self.thumbnail = AndesThumbnail(hierarchy: .defaultHierarchy, type: .imageCircle, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)
                }

                it("Has the right simple cell view medium type with icon") {
                    //Given
                    let simplecell = AndesSimpleCell(withTitle: "Title",
                                                         size: .medium,
                                                         subtitle: "Sub title")

                    let chevronCell = AndesChevronCell(withTitle: "Title",
                                                          size: .medium,
                                                          subtitle: "Descripción de la celda",
                                                          thumbnail: self.icon)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListCell.self)).to(beTrue())
                }

                it("Has the right simple cell view small type with icon") {
                    //Given
                    let simplecell = AndesSimpleCell(withTitle: "Title",
                                                         size: .small,
                                                         subtitle: "Sub title")

                    let chevronCell = AndesChevronCell(withTitle: "Title",
                                                          size: .small,
                                                          subtitle: "Descripción de la celda",
                                                          thumbnail: self.icon)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListCell.self)).to(beTrue())
                }

                it("Has the right simple cell view large type with icon") {
                    //Given
                    let simplecell = AndesSimpleCell(withTitle: "Title",
                                                         size: .large,
                                                         subtitle: "Sub title")

                    let chevronCell = AndesChevronCell(withTitle: "Title",
                                                          size: .large,
                                                          subtitle: "Descripción de la celda",
                                                          thumbnail: self.icon)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListCell.self)).to(beTrue())
                }

                it("Has the right simple cell view medium type with image circle") {
                    //Given
                    let simplecell = AndesSimpleCell(withTitle: "Title",
                                                         size: .medium,
                                                         subtitle: "Sub title")

                    let chevronCell = AndesChevronCell(withTitle: "Title",
                                                          size: .medium,
                                                          subtitle: "Descripción de la celda",
                                                          thumbnail: self.thumbnail)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListCell.self)).to(beTrue())
                }

                it("Has the right simple cell view small type with image circle") {
                    //Given
                    let simplecell = AndesSimpleCell(withTitle: "Title",
                                                         size: .small,
                                                         subtitle: "Sub title")

                    let chevronCell = AndesChevronCell(withTitle: "Title",
                                                          size: .small,
                                                          subtitle: "Descripción de la celda",
                                                          thumbnail: self.thumbnail)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListCell.self)).to(beTrue())
                }

                it("Has the right simple cell view large type with image circle") {
                    //Given
                    let simplecell = AndesSimpleCell(withTitle: "Title",
                                                         size: .large,
                                                         subtitle: "Sub title")

                    let chevronCell = AndesChevronCell(withTitle: "Title",
                                                          size: .large,
                                                          subtitle: "Descripción de la celda",
                                                          thumbnail: self.thumbnail)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListCell.self)).to(beTrue())
                }
            }
        }

        describe("AndesList should draw it's view based on style and size") {
            context("AndesList Implementation self delegate") {
                var myDelegate: AndesListTableViewDelegate?
                var myDataSource: AndesListTableViewDataSource?

                beforeEach {
                    myDelegate = AndesListTableViewDelegate(listProtocol: self)
                    myDataSource = AndesListTableViewDataSource(listProtocol: self)
                    self.internalAndesList = AndesList(type: "simple")
                    self.internalAndesList?.dataSource = self
                    self.internalAndesList?.delegate = self

                    self.titleArray = ["Title 1", "Title 2"]

                    self.internalAndesList!.reloadData()
                }

                it("Check numberOfRowsInSection dataSource in TableView") {
                    // Then
                    expect(myDataSource?.tableView(UITableView(), numberOfRowsInSection: 2)) == self.titleArray?.count
                }

                it("Check numberOfSections dataSource in TableView") {
                    //Then
                    expect(myDataSource?.numberOfSections(in: UITableView())) == 1
                }

                it("Check didSelectRowAt delegate in TableView") {

                    //When
                    myDelegate?.tableView(UITableView(), didSelectRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(self.didSelected).to(beTrue())
                }

                it("Check cellForRowAt delegate with simple cell without icon in TableView") {
                    //Given
                    self.internalAndesList?.listType = "simple"
                    self.cellType = .simple
                    let table = UITableView()
                    table.dataSource = myDataSource
                    table.delegate = myDelegate
                    table.register(UINib(nibName: "AndesListSimpleViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListSimpleViewCell")

                    //When
                    let cell = myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListCell.self))
                }

                it("Check cellForRowAt delegate with simple cell and icon in TableView") {
                    //Given
                    self.internalAndesList?.listType = "simple"
                    self.cellType = .simple
                    self.thumbnailType = .icon
                    let table = UITableView()
                    table.dataSource = myDataSource
                    table.delegate = myDelegate
                    table.register(UINib(nibName: "AndesListSimpleViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListSimpleViewCell")

                    //When
                    let cell = myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListCell.self))
                }

                it("Check cellForRowAt delegate with chevron cell and icon in TableView") {
                    //Given
                    self.internalAndesList?.listType = "chevron"
                    self.cellType = .chevron
                    self.thumbnailType = .icon
                    let table = UITableView()
                    table.dataSource = myDataSource
                    table.delegate = myDelegate
                    table.register(UINib(nibName: "AndesListChevronViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListChevronViewCell")

                    //When
                    let cell = myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListCell.self))
                }
                it("Check cellForRowAt delegate with simple cell and ImageCircle in TableView") {
                    //Given
                    self.internalAndesList?.listType = "simple"
                    self.cellType = .simple
                    self.thumbnailType = .imageCircle
                    let table = UITableView()
                    table.dataSource = myDataSource
                    table.delegate = myDelegate
                    table.register(UINib(nibName: "AndesListSimpleViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListSimpleViewCell")

                    //When
                    let cell = myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListCell.self))
                }

                it("Check cellForRowAt delegate with chevron cell and ImageCircle in TableView") {
                    //Given
                    self.internalAndesList?.listType = "chevron"
                    self.cellType = .chevron
                    self.thumbnailType = .imageCircle
                    let table = UITableView()
                    table.dataSource = myDataSource
                    table.delegate = myDelegate
                    table.register(UINib(nibName: "AndesListChevronViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListChevronViewCell")

                    //When
                    let cell = myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListCell.self))
                }

                it("Check didSelectRowAt delegate") {
                    //Given
                    self.cellType = .none
                    self.thumbnailType = .icon

                    //When
                    self.internalAndesList?.didSelectRowAt(indexPath: IndexPath(row: 1, section: 0))

                    //Then
                    expect(self.didSelected).to(beTrue())
                }

                it("Check cellForRowAt delegate") {
                    //Given
                    self.cellType = .simple
                    self.thumbnailType = .icon

                    //When
                    let cell = self.internalAndesList?.cellForRowAt(indexPath: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListCell.self))
                }
            }
        }

        describe("AndesList should draw it's view based on style and size") {
            context("AndesList Implementation own delegate") {

                beforeEach {
                    self.internalAndesList = AndesList(type: "simple")
                    self.internalAndesList?.dataSource = self
                    self.internalAndesList?.delegate = self

                    self.titleArray = ["Title 1", "Title 2"]

                    self.internalAndesList!.reloadData()
                }

                it("Check separator Style") {
                    //Given
                    self.internalAndesList?.listType = "chevron"
                    self.cellType = .chevron
                    self.thumbnailType = .icon
                    let style = AndesSeparatorStyle.none

                    //When
                    self.internalAndesList?.separatorStyle = .none

                    //Then
                    expect(self.internalAndesList?.getSeparatorStyle()).to(equal(style))
                }
            }
        }
    }
}

extension AndesListTests: AndesListDataSource {
    func andesList(_ listView: AndesList, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray?.count ?? 0
    }

    func numberOfSections(_ listView: AndesList) -> Int {
        return 1
    }

    func andesList(_ listView: AndesList, cellForRowAt indexPath: IndexPath) -> AndesListCell {
        switch cellType {
        case .simple:
            let cell = AndesSimpleCell(withTitle: titleArray?[indexPath.row] ?? "",
                                       size: .medium,
                                       subtitle: "Descripción -- Descripción -- Descripción -- Descripción")
            return cell
        case .chevron:
            let thumbnail = AndesThumbnail(hierarchy: .defaultHierarchy, type: self.thumbnailType!, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)

            let cell = AndesChevronCell(withTitle: titleArray?[indexPath.row] ?? "",
                                        size: .medium,
                                        subtitle: "Descripción de la celda",
                                        thumbnail: thumbnail)
            return cell
        default:
            return AndesListCell()
        }
    }
}

extension AndesListTests: AndesListDelegate {
    func andesList(_ listView: AndesList, didSelectRowAt indexPath: IndexPath) {
        self.didSelected = true
    }
}

extension AndesListTests: AndesListProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray?.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

//    func andesList(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.andesList(self.internalAndesList!, numberOfRowsInSection: section)
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.numberOfSections(in: tableView)
//    }

    func cellForRowAt(indexPath: IndexPath) -> AndesListCell {
        let customCell = self.andesList(self.internalAndesList!, cellForRowAt: indexPath)
        return customCell
    }

    func getSeparatorStyle() -> AndesSeparatorStyle {
        return .none
    }

    func didSelectRowAt(indexPath: IndexPath) {
        self.didSelected = true
    }
}
