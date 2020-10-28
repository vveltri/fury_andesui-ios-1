//
//  AndesListViewTest.swift
//  AndesUI_Tests
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesListViewTests: QuickSpec {

    var titleArray: [String]?
    var internalListView: AndesListView?
    weak var myDelegate: AndesListViewTableViewDelegate?
    var myDataSource: AndesListViewTableViewDataSource?
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
                    let simplecell = AndesSimpleViewCellConfig(withTitle: "Title",
                                                         size: .medium,
                                                         subTitle: "Sub title")

                    let chevronCell = AndesChevronViewCellConfig(withTitle: "Title",
                                                          size: .medium,
                                                          subTitle: "Descripción de la celda",
                                                          thumbnail: self.icon)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListViewCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListViewCell.self)).to(beTrue())
                }

                it("Has the right simple cell view small type with icon") {
                    //Given
                    let simplecell = AndesSimpleViewCellConfig(withTitle: "Title",
                                                         size: .small,
                                                         subTitle: "Sub title")

                    let chevronCell = AndesChevronViewCellConfig(withTitle: "Title",
                                                          size: .small,
                                                          subTitle: "Descripción de la celda",
                                                          thumbnail: self.icon)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListViewCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListViewCell.self)).to(beTrue())
                }

                it("Has the right simple cell view large type with icon") {
                    //Given
                    let simplecell = AndesSimpleViewCellConfig(withTitle: "Title",
                                                         size: .large,
                                                         subTitle: "Sub title")

                    let chevronCell = AndesChevronViewCellConfig(withTitle: "Title",
                                                          size: .large,
                                                          subTitle: "Descripción de la celda",
                                                          thumbnail: self.icon)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListViewCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListViewCell.self)).to(beTrue())
                }

                it("Has the right simple cell view medium type with image circle") {
                    //Given
                    let simplecell = AndesSimpleViewCellConfig(withTitle: "Title",
                                                         size: .medium,
                                                         subTitle: "Sub title")

                    let chevronCell = AndesChevronViewCellConfig(withTitle: "Title",
                                                          size: .medium,
                                                          subTitle: "Descripción de la celda",
                                                          thumbnail: self.thumbnail)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListViewCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListViewCell.self)).to(beTrue())
                }

                it("Has the right simple cell view small type with image circle") {
                    //Given
                    let simplecell = AndesSimpleViewCellConfig(withTitle: "Title",
                                                         size: .small,
                                                         subTitle: "Sub title")

                    let chevronCell = AndesChevronViewCellConfig(withTitle: "Title",
                                                          size: .small,
                                                          subTitle: "Descripción de la celda",
                                                          thumbnail: self.thumbnail)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListViewCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListViewCell.self)).to(beTrue())
                }

                it("Has the right simple cell view large type with image circle") {
                    //Given
                    let simplecell = AndesSimpleViewCellConfig(withTitle: "Title",
                                                         size: .large,
                                                         subTitle: "Sub title")

                    let chevronCell = AndesChevronViewCellConfig(withTitle: "Title",
                                                          size: .large,
                                                          subTitle: "Descripción de la celda",
                                                          thumbnail: self.thumbnail)

                    //When

                    //Then
                    expect(simplecell.isKind(of: AndesListViewCell.self)).to(beTrue())
                    expect(chevronCell.isKind(of: AndesListViewCell.self)).to(beTrue())
                }
            }
        }

        describe("AndesList should draw it's view based on style and size") {
            context("AndesList Implementation self delegate") {

                beforeEach {
                    self.internalListView = AndesListView(type: "simple")
                    self.internalListView?.dataSource = self
                    self.internalListView?.delegate = self

                    self.myDelegate = AndesListViewTableViewDelegate(listView: self)
                    self.myDataSource = AndesListViewTableViewDataSource(listView: self)

                    self.titleArray = ["Title 1", "Title 2"]
                    self.internalListView?.numberOfRows = self.titleArray?.count ?? 0

                    self.internalListView!.reloadData()
                }

                it("Check numberOfRowsInSection dataSource in TableView") {
                    // Then
                    expect(self.myDataSource?.tableView(UITableView(), numberOfRowsInSection: 2)) == self.titleArray?.count
                }

                it("Check numberOfSections dataSource in TableView") {
                    //Then
                    expect(self.myDataSource?.numberOfSections(in: UITableView())) == 1
                }

                it("Check didSelectRowAt delegate in TableView") {

                    //When
                    self.myDelegate?.tableView(UITableView(), didSelectRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(self.didSelected).to(beTrue())
                }

                it("Check cellForRowAt delegate with simple cell and icon in TableView") {
                    //Given
                    self.internalListView?.listType = "simple"
                    self.cellType = .simple
                    self.thumbnailType = .icon
                    let table = UITableView()
                    table.dataSource = self.myDataSource
                    table.delegate = self.myDelegate
                    table.register(UINib(nibName: "AndesListSimpleViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListSimpleViewCell")

                    //When
                    let cell = self.myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListViewCell.self))
                }

                it("Check cellForRowAt delegate with chevron cell and icon in TableView") {
                    //Given
                    self.internalListView?.listType = "chevron"
                    self.cellType = .chevron
                    self.thumbnailType = .icon
                    let table = UITableView()
                    table.dataSource = self.myDataSource
                    table.delegate = self.myDelegate
                    table.register(UINib(nibName: "AndesListCevronViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListCevronViewCell")

                    //When
                    let cell = self.myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListViewCell.self))
                }
                it("Check cellForRowAt delegate with simple cell and ImageCircle in TableView") {
                    //Given
                    self.internalListView?.listType = "simple"
                    self.cellType = .simple
                    self.thumbnailType = .imageCircle
                    let table = UITableView()
                    table.dataSource = self.myDataSource
                    table.delegate = self.myDelegate
                    table.register(UINib(nibName: "AndesListSimpleViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListSimpleViewCell")

                    //When
                    let cell = self.myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListViewCell.self))
                }

                it("Check cellForRowAt delegate with chevron cell and ImageCircle in TableView") {
                    //Given
                    self.internalListView?.listType = "chevron"
                    self.cellType = .chevron
                    self.thumbnailType = .imageCircle
                    let table = UITableView()
                    table.dataSource = self.myDataSource
                    table.delegate = self.myDelegate
                    table.register(UINib(nibName: "AndesListCevronViewCell",
                                         bundle: AndesBundle.bundle()),
                                   forCellReuseIdentifier: "AndesListCevronViewCell")

                    //When
                    let cell = self.myDataSource?.tableView(table, cellForRowAt: IndexPath(row: 1, section: 0))

                    //Then
                    expect(cell).to(beAKindOf(AndesListViewCell.self))
                }

                it("Check didSelectRowAt delegate") {
                    //Given
                    self.cellType = .none
                    self.thumbnailType = .icon

                    //When
                    self.internalListView?.didSelectRowAt(indexPath: IndexPath(row: 1, section: 0))

                    //Then
                    expect(self.didSelected).to(beTrue())
                }
            }
        }

        describe("AndesList should draw it's view based on style and size") {
            context("AndesList Implementation own delegate") {

                beforeEach {
                    self.internalListView = AndesListView(type: "simple")
                    self.internalListView?.dataSource = self
                    self.internalListView?.delegate = self

                    self.myDelegate = AndesListViewTableViewDelegate(listView: self.internalListView!)
                    self.myDataSource = AndesListViewTableViewDataSource(listView: self.internalListView!)

                    self.titleArray = ["Title 1", "Title 2"]
                    self.internalListView?.numberOfRows = self.titleArray?.count ?? 0

                    self.internalListView!.reloadData()
                }

                it("Check separator Style") {
                    //Given
                    self.internalListView?.listType = "chevron"
                    self.cellType = .chevron
                    self.thumbnailType = .icon
                    let style = AndesSeparatorStyle.none

                    //When
                    self.internalListView?.separatorStyle = .none

                    //Then
                    expect(self.internalListView?.getSeparatorStyle()).to(equal(style))
                }
            }
        }
    }
}

extension AndesListViewTests: AndesListViewDataSource {
    func andesListView(_ listView: AndesListView, cellForRowAt indexPath: IndexPath) -> AndesListViewCell {
        switch cellType {
        case .simple:
            let cell = AndesSimpleViewCellConfig(withTitle: titleArray?[indexPath.row] ?? "",
                                                 size: .medium,
                                                 subTitle: "Descripción -- Descripción -- Descripción -- Descripción")
            return cell
        case .chevron:
            let thumbnail = AndesThumbnail(hierarchy: .defaultHierarchy, type: self.thumbnailType!, size: .size24, state: .enabled, image: UIImage(named: "andes") ?? UIImage(), accentColor: UIColor.clear)

            let cell = AndesChevronViewCellConfig(withTitle: titleArray?[indexPath.row] ?? "",
                                                  size: .medium,
                                                  subTitle: "Descripción de la celda",
                                                  thumbnail: thumbnail)
            return cell
        default:
            return AndesListViewCell()
        }
    }
}

extension AndesListViewTests: AndesListViewDelegate {
    func andesListView(_ listView: AndesListView, didSelectRowAt indexPath: IndexPath) {
        self.didSelected = true
    }
}

extension AndesListViewTests: AndesListViewProtocol {
    func getNumberOfRows() -> Int {
        return self.titleArray?.count ?? 0
    }

    func numberOfSections() -> Int {
        return 1
    }

    func cellForRowAt(indexPath: IndexPath) -> AndesListViewCell {
        let customCell = self.andesListView(self.internalListView!, cellForRowAt: indexPath)
        return customCell
    }

    func getSeparatorStyle() -> AndesSeparatorStyle {
        return .none
    }

    func didSelectRowAt(indexPath: IndexPath) {
        self.didSelected = true
    }
}
