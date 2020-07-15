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
                it("Andes message by default should be neutral, loud and of defaultView") {
                    //Given
                    let defaultHierarchy = AndesMessageHierarchy.loud
                    let defaultType = AndesMessageType.neutral

                    //When
                    let message = AndesMessage(frame: .zero)

                    //Then
                    expect({return message.hierarchy == defaultHierarchy ? .succeeded : .failed(reason: "wrong default hierarchy")}).to(succeed())
                    expect({return message.type == defaultType ? .succeeded : .failed(reason: "wrong default type")}).to(succeed())
                    expect(message.contentView.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
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
                    expect(message.contentView.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
                    expect((message.contentView as! AndesMessageDefaultView).titleLabel.text).to(match(title))
                    expect((message.contentView as! AndesMessageDefaultView).bodyLabel.text).to(match(body))
                    expect((message.contentView as! AndesMessageDefaultView).leftPipeView.backgroundColor) == AndesMessageTypeSuccess().primaryColor
                    expect((message.contentView as! AndesMessageDefaultView).backgroundColor) == AndesMessageHierarchyQuiet(type: AndesMessageTypeSuccess()).backgroundColor
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
                    message.hierarchy = hierarchyToChange

                    //Then
                    expect((message.contentView as! AndesMessageDefaultView).backgroundColor) == AndesMessageHierarchyQuiet(type: AndesMessageTypeHightlight()).backgroundColor
                    expect((message.contentView as! AndesMessageDefaultView).leftPipeView.backgroundColor) == AndesMessageTypeHightlight().primaryColor
                }
                it("changes andes message type dinamycally") {
                      //Given
                      let typeToChange: AndesMessageType = .error
                      let message = AndesMessage(frame: .zero)

                      //When
                      message.type = typeToChange

                      //Then
                      expect((message.contentView as! AndesMessageDefaultView).backgroundColor) == AndesMessageHierarchyLoud(type: AndesMessageTypeError()).backgroundColor
                      expect((message.contentView as! AndesMessageDefaultView).leftPipeView.backgroundColor) == AndesMessageTypeError().primaryColor
                  }
                it("changes andes message title dinamycally") {
                      //Given
                      let titleToChange: String = "new title"
                      let message = AndesMessage(frame: .zero)

                      //When
                      message.title = titleToChange

                      //Then
                      expect((message.contentView as! AndesMessageDefaultView).titleLabel.text).to(match(titleToChange))
                  }
                it("changes andes message description dinamycally") {
                      //Given
                      let descToChange: String = "new message"
                      let message = AndesMessage(frame: .zero)

                      //When
                      message.body = descToChange

                      //Then
                      expect((message.contentView as! AndesMessageDefaultView).bodyLabel.text).to(match(descToChange))
                  }
                it("changes andes message view dinamycally to actionsView") {
                    //Given
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setPrimaryAction("Primary", handler: nil)
                    message.setSecondaryAction("Secondary", handler: nil)

                    //Then
                    expect(message.contentView.isKind(of: AndesMessageWithActionsView.self)).to(beTrue())
                }
                it("changes andes message view dinamycally to actionsView") {
                    //Given
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setLinkAction("Link", handler: nil)

                    //Then
                    expect(message.contentView.isKind(of: AndesMessageWithActionsView.self)).to(beTrue())
                }
                it("changes andes message view dinamycally back to defaultView") {
                    //Given
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setPrimaryAction("Primary", handler: nil)
                    message.setPrimaryAction("", handler: nil)

                    //Then
                    expect(message.contentView.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
                }
                it("changes andes message view dinamycally back to defaultView") {
                    //Given
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setLinkAction("Primary", handler: nil)
                    message.setLinkAction("", handler: nil)

                    //Then
                    expect(message.contentView.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
                }
                it("when title is empty or nil, title is hidden") {
                    //Given
                    let message = AndesMessage(frame: .zero)
                    let messageEmpty = AndesMessage(frame: .zero)

                    //When
                    message.title = nil
                    messageEmpty.title = ""

                    //Then
                    expect((message.contentView as! AndesMessageDefaultView).titleLabel.isHidden).to(beTrue())
                    expect((messageEmpty.contentView as! AndesMessageDefaultView).titleLabel.isHidden).to(beTrue())
                }
                it("when title is not empty, title label is not hidden") {
                   //Given
                   let message = AndesMessage(frame: .zero)

                   //When
                   message.title = "title"

                   //Then
                   expect((message.contentView as! AndesMessageDefaultView).titleLabel.isHidden).to(beFalse())
               }
                it("dont show actions if only secondary setted") {
                    //Given
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setSecondaryAction("Secondary", handler: nil)

                    //Then
                    expect(message.contentView.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
                }
                it("dont show actions if primary and link actions are setted") {
                    //Given
                    let message = AndesMessage(frame: .zero)

                    //When
                    message.setPrimaryAction("Primary", handler: nil)
                    message.setLinkAction("Link", handler: nil)

                    //Then
                    expect(message.contentView.isKind(of: AndesMessageDefaultView.self)).to(beTrue())
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
                    (message.contentView as! AndesMessageDefaultView).dismissPressed(self)

                    //Then
                    expect(called).toEventually(beTrue())
                }
            }
            context("AndesMessage primary action") {
                it("calls primary button handler") {
                    //Given
                    let message = AndesMessage(frame: .zero)
                    var called = false
                    message.setPrimaryAction("Primary") { _ in called = true}

                    //When
                    (message.contentView as! AndesMessageWithActionsView).primaryButtonTapped(self)

                    //Then
                    expect(called).toEventually(beTrue())
                }
            }
            context("AndesMessage default callbacks") {
                it("calls secondary button handler") {
                    //Given
                    let message = AndesMessage(frame: .zero)
                    var called = false
                    message.setPrimaryAction("Primary", handler: nil)
                    message.setSecondaryAction("Secondary") { _ in called = true}

                    //When
                    (message.contentView as! AndesMessageWithActionsView).secondaryButtonTapped(self)

                    //Then
                    expect(called).toEventually(beTrue())
                }
            }
            context("AndesMessage Link Action") {
                it("calls link button handler") {
                    //Given
                    let message = AndesMessage(frame: .zero)
                    var called = false
                    message.setLinkAction("Link") { _ in called = true}

                    //When
                    (message.contentView as! AndesMessageWithActionsView).primaryButtonTapped(self)

                    //Then
                    expect(called).toEventually(beTrue())
                }
            }
        }
    }
}
