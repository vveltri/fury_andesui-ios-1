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

    override func spec() {
        describe("AndesList should draw it's view based on style and size") {
            context("AndesList Implementation") {
                it("AndesList by default should be simple with medium size") {
                    // Given
                    let listView = AndesListView()
                    self.titleArray = ["Title 1", "Title 2"]
                    listView.numberOfRows = self.titleArray?.count ?? 0
                    listView.dataSource = self
                    listView.delegate = self

                    // When
                    listView.reloadData()

                    // Then
                    expect(listView.numberOfRows).to(equal(2))
                }

                it("Andes Badge with custom hierarchy, type, text, and border") {
                    //Given

                }
            }
        }
    }
}

extension AndesListViewTests: AndesListViewDataSourceProtocol {
    func andesListView(_ listView: AndesListView, cellForRowAt indexPath: IndexPath) -> AndesListViewCell {
        let cell = AndesSimpleViewCellConfig(withTitle: titleArray?[indexPath.row] ?? "",
                                             subTitle: "Descripción -- Descripción -- Descripción -- Descripción")

        return cell
    }
}

extension AndesListViewTests: AndesListViewDelegateProtocol {
    func andesListView(_ listView: AndesListView, didSelectRowAt indexPath: IndexPath) {

    }
}
