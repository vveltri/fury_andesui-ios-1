//
//  AndesCoachmarkFooterTests.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 18/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesCoachmarkFooterTests: QuickSpec {
    override func spec() {

        describe("Coachmark footer tests") {
            context("Footer view") {
                it("Correct height") {
                    let footer = AndesCoachMarkFooterView()
                    //expect(footer.heightAnchor.constant).to(equal(96))
                }
            }
        }
    }
}
