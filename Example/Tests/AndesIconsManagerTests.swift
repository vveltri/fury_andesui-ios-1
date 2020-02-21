//
//  AndesIconsProviderTests.swift
//  AndesUI-demoapp
//
//  Created by Nicolas Rostan Talasimov on 2/19/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class IconsStrategyTest: AndesIconsStrategy {
    enum TestErr: Error {
        case failed
    }
    func loadIcon(name: String, success: (UIImage?) -> Void, failure: ((Error?) -> Void)?) {
        if name == "error" {
            failure?(TestErr.failed)
        } else if name == "iconName" {
            success(UIImage())
        } else {
            success(nil)
        }
    }
}

class AndesIconsProviderTests: QuickSpec {
    override func spec() {
        describe("AndesIconsProvider shoould provide icons") {
        context("AndesIconsProvider with custom strategy") {
            it("search for icon and finds it") {
                //Given
                let strategy = IconsStrategyTest()
                var successCalled = false

                //When
                AndesIconsProvider.strategy = strategy
                AndesIconsProvider.loadIcon(name: "iconName", success: {
                    if $0 != nil {
                        successCalled = true
                    }
                })

                //Then
                expect(successCalled).toEventually(beTrue())

                }
                it("search for icon and doesn't find it") {
                //Given
                let strategy = IconsStrategyTest()
                var successNil = false

                //When
                AndesIconsProvider.strategy = strategy
                AndesIconsProvider.loadIcon(name: "notFound", success: {
                    if $0 == nil {
                        successNil = true
                    }
                })

                //Then
                expect(successNil).toEventually(beTrue())

                }
                it("search for icon and there's a failure ") {
                //Given
                let strategy = IconsStrategyTest()
                var failureCalled = false

                //When
                AndesIconsProvider.strategy = strategy
                    AndesIconsProvider.loadIcon(name: "error", success: {_ in }, failure: { _ in
                        failureCalled = true
                    })

                //Then
                expect(failureCalled).toEventually(beTrue())

                }
            }
        }
    }
}
