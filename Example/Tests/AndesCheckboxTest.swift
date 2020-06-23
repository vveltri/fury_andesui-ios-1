//
//  AndesCheckboxTest.swift
//  AndesUI_Tests
//
//  Created by Rodrigo Pintos Costa on 6/23/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCheckboxTests: QuickSpec {
    override func spec() {
        describe("Andes checkbox should draw its view depends on their properties") {
            context("When creating AndesCheckbox") {
                it("Has the idle view type, left view align, selected view status") {
                    let checkbox = AndesCheckbox(type: .idle, align: .left, status: .selected, title: "Checkbox")
                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.idle))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.selected))

                }

                it("Has the idle view type, left view align, unselected view status") {
                    let checkbox = AndesCheckbox(type: .idle, align: .left, status: .unselected, title: "Checkbox")
                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.idle))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.unselected))
                }

                it("Has the idle view type, left view align, undefined view status") {
                    let checkbox = AndesCheckbox(type: .idle, align: .left, status: .undefined, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.idle))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.undefined))

                }

                it("Has the idle view type, left view align, selected view status") {
                    let checkbox = AndesCheckbox(type: .idle, align: .right, status: .selected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.idle))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.selected))

                }

                it("Has the idle view type, left view align, unselected view status") {
                    let checkbox = AndesCheckbox(type: .idle, align: .right, status: .unselected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.idle))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.unselected))

                }

                it("Has the idle view type, left view align, undefined view status") {
                    let checkbox = AndesCheckbox(type: .idle, align: .right, status: .undefined, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.idle))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.undefined))

                }
            }

            context("When creating AndesCheckbox") {
                it("Has the disabled view type, left view align, selected view status") {
                    let checkbox = AndesCheckbox(type: .disabled, align: .left, status: .selected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.disabled))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.selected))
                }

                it("Has the disabled view type, left view align, unselected view status") {
                    let checkbox = AndesCheckbox(type: .disabled, align: .left, status: .unselected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.disabled))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.unselected))
                }

                it("Has the disabled view type, left view align, undefined view status") {
                    let checkbox = AndesCheckbox(type: .disabled, align: .left, status: .undefined, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.disabled))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.undefined))
                }

                it("Has the disabled view type, right view align, selected view status") {
                    let checkbox = AndesCheckbox(type: .disabled, align: .right, status: .selected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.disabled))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.selected))
                }

                it("Has the disabled view type, right view align, unselected view status") {
                    let checkbox = AndesCheckbox(type: .disabled, align: .right, status: .unselected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.disabled))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.unselected))
                }

                it("Has the disabled view type, left view align, undefined view status") {
                    let checkbox = AndesCheckbox(type: .disabled, align: .right, status: .undefined, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.disabled))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.undefined))
                }
            }

            context("When creating AndesCheckbox") {
                it("Has the error view type, left view align, unselected view status") {
                    let checkbox = AndesCheckbox(type: .error, align: .left, status: .unselected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.error))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.left))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.unselected))
                }

                it("Has the error view type, right view align, unselected view status") {
                    let checkbox = AndesCheckbox(type: .error, align: .right, status: .unselected, title: "Checkbox")

                    expect(checkbox.title).to(equal("Checkbox"))
                    expect(checkbox.type).to(equal(AndesCheckboxType.error))
                    expect(checkbox.align).to(equal(AndesCheckboxAlign.right))
                    expect(checkbox.status).to(equal(AndesCheckboxStatus.unselected))
                }
            }
        }
    }
}
