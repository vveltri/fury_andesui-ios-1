//
//  AndesMessageTests.swift
//  AndesUI_Example
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesMessageTests: QuickSpec {
    override func spec() {
        describe("AndesMessage should draw its view depending on type, type, and variation") {
            context("AndesMessage dismissable with title and description inits") {
                it("Andes message by default should be highlight, loud and of defaultView") {
                    //Given
                    let defaultHierarchy = AndesMessageHierarchy.loud
                    let defaultType = AndesMessageType.highlight

                    //When
                    let message = AndesMessage(frame: .zero)

                    //Then
                    expect({return message.hierarchy == defaultHierarchy ? .succeeded : .failed(reason: "wrong default hierarchy")}).to(succeed())
                    expect({return message.type == defaultType ? .succeeded : .failed(reason: "wrong default type")}).to(succeed())
                    expect(message.view.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
                    }

                it("Andes message with custom hierarchy, type, title, and description") {
                    //Given
                    let title = "Msg Title"
                    let body = "Msg Description"
                    let hierarchy: AndesMessageHierarchy = .quiet
                    let type: AndesMessageType = .success

                    //When
                    let message = AndesMessage(hierarchy: hierarchy, type: type, title: title, body: body)

                    //Then
                    expect(message.view.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
                    expect((message.view as! AndesMessageDefaultView).titleLabel.text).to(match(title))
                    expect((message.view as! AndesMessageDefaultView).bodyLabel.text).to(match(body))
                    expect((message.view as! AndesMessageDefaultView).leftPipeView.backgroundColor) == AndesMessageTypeSuccess().primaryColor
                    expect((message.view as! AndesMessageDefaultView).backgroundColor) == AndesMessageHierarchyQuiet(type: AndesMessageTypeSuccess()).backgroundColor
                    }
                }
            }
        describe("AndesMessage should be able to change its ui dinamically") {
            context("AndesMessage default view changes attributes") {
                it("changes andes message hierarchy dinamycally") {
                    //Given
                    let hierarchyToChange: AndesMessageHierarchy = .quiet
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setHierarchy(hierarchyToChange)

                    //Then
                    expect((message.view as! AndesMessageDefaultView).backgroundColor) == AndesMessageHierarchyQuiet(type: AndesMessageTypeHightlight()).backgroundColor
                    expect((message.view as! AndesMessageDefaultView).leftPipeView.backgroundColor) == AndesMessageTypeHightlight().primaryColor
                }
                it("changes andes message type dinamycally") {
                      //Given
                      let typeToChange: AndesMessageType = .error
                      let message = AndesMessage(frame: .zero)

                      //When
                      message.setType(typeToChange)

                      //Then
                      expect((message.view as! AndesMessageDefaultView).backgroundColor) == AndesMessageHierarchyLoud(type: AndesMessageTypeError()).backgroundColor
                      expect((message.view as! AndesMessageDefaultView).leftPipeView.backgroundColor) == AndesMessageTypeError().primaryColor
                  }
                it("changes andes message title dinamycally") {
                      //Given
                      let titleToChange: String = "new title"
                      let message = AndesMessage(frame: .zero)

                      //When
                      message.setTitle(titleToChange)

                      //Then
                      expect((message.view as! AndesMessageDefaultView).titleLabel.text).to(match(titleToChange))
                  }
                it("changes andes message description dinamycally") {
                      //Given
                      let descToChange: String = "new message"
                      let message = AndesMessage(frame: .zero)

                      //When
                      message.setBody(descToChange)

                      //Then
                      expect((message.view as! AndesMessageDefaultView).bodyLabel.text).to(match(descToChange))
                  }
                it("when title is empty or nil, title is hidden") {
                    //Given
                    let message = AndesMessage(frame: .zero)
                    let messageEmpty = AndesMessage(frame: .zero)

                    //When
                    message.setTitle(nil)
                    messageEmpty.setTitle("")

                    //Then
                    expect((message.view as! AndesMessageDefaultView).titleLabel.isHidden).to(beTrue())
                    expect((messageEmpty.view as! AndesMessageDefaultView).titleLabel.isHidden).to(beTrue())
                }
                it("when title is not empty, title label is not hidden") {
                       //Given
                       let message = AndesMessage(frame: .zero)

                       //When
                       message.setTitle("title")

                       //Then
                       expect((message.view as! AndesMessageDefaultView).titleLabel.isHidden).to(beFalse())
                   }
            }
        }
        describe("AndesMessage should trigger callbacks on specific events") {
            context("AndesMessage default callbacks") {
                it("calls dismiss") {
                    //Given
                    let message = AndesMessage(frame: .zero)
                    var called = false
                    message.onDismiss { _ in called = true}

                    //When
                    (message.view as! AndesMessageDefaultView).dismissPressed(self)

                    //Then
                    expect(called).toEventually(beTrue())
                }
            }
        }
    }
}
