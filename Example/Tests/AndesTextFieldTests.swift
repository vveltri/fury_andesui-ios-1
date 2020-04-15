//
//  AndesTextFieldTests.swift
//  AndesUI_Tests
//
//  Created by Martin Damico on 01/04/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
@testable import AndesUI

class AndesTextFieldTests: QuickSpec {

    override func spec() {
        describe("Tests AndesTextField") {
            context("AndesTextField") {
                it("Should be an AndesTextField") {
                    //Given
                    let idle: AndesTextFieldState = .idle

                    //When
                    let textField = AndesTextField()
                    textField.state = idle

                    //Expect
                    expect(textField.state == AndesTextFieldState.idle).to(beTrue())
                }

                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is left") {
                    //Given
                    let disabled: AndesTextFieldState = .disabled

                    //When
                    let textField = AndesTextField()
                    textField.state = disabled

                    //Expect
                    expect(textField.state == AndesTextFieldState.disabled).to(beTrue())
                }
                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is left") {
                    //Given
                    let error: AndesTextFieldState = .error

                    //When
                    let textField = AndesTextField()
                    textField.state = error

                    //Expect
                    expect(textField.state == AndesTextFieldState.error).to(beTrue())
                }
                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is left") {
                    //Given
                    let readOnly: AndesTextFieldState = .readOnly

                    //When
                    let textField = AndesTextField()
                    textField.state = readOnly

                    //Expect
                    expect(textField.state == AndesTextFieldState.readOnly).to(beTrue())
                }

                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is right") {

                    //Given
                    let idle: AndesTextFieldState = .idle

                    //When
                    let textArea = AndesTextArea()
                    textArea.state = idle

                    //Expect
                    expect(textArea.state == .idle).to(beTrue())
                }

                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is right") {

                    //Given
                    let disabled: AndesTextFieldState = .disabled

                    //When
                    let textArea = AndesTextArea()
                    textArea.state = disabled

                    //Expect
                    expect(textArea.state == AndesTextFieldState.disabled).to(beTrue())
                }

                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is right") {

                    //Given
                    let error: AndesTextFieldState = .error

                    //When
                    let textField = AndesTextField()
                    textField.state = error

                    //Expect
                    expect(textField.state == AndesTextFieldState.error).to(beTrue())
                }

                it("Should be an AndesButtonLargeLeftIcon subclass if icon is provided and orientation is right") {

                    //Given
                    let readOnly: AndesTextFieldState = .readOnly

                    //When
                    let textArea = AndesTextArea()
                    textArea.state = readOnly

                    //Expect
                    expect(textArea.state == AndesTextFieldState.readOnly).to(beTrue())
                }
            }
        }

        describe("AndesTextField should be able to block typing when counter reaches the limit") {
            context("AndesTextField is typed") {
                it("should block typing") {
                    //Given
                    let text = "9 letters"

                    //When
                    let textField = AndesTextField()
                    textField.counter = 9
                    textField.text = text

                    //Then
                    let view: AndesTextFieldDefaultView = textField.contentView as! AndesTextFieldDefaultView

                    expect(view.text == text).to(beTrue())
                    expect(view.counterLabel.text == "9 / 9").to(beTrue())
                }
            }
        }

        describe("AndesTextField should be able to show text") {
            context("AndesTextField is setted up") {
                it("should have a label with the actual title") {
                    //Given
                    let labelText = "Label Test"
                    let helperText = "Helper Text"

                    //When
                    let textField = AndesTextField()
                    textField.label = labelText
                    textField.helper = helperText

                    //Then
                    let view: AndesTextFieldDefaultView = textField.contentView as! AndesTextFieldDefaultView
                    expect(view.labelLabel.text == labelText).to(beTrue())
                    expect(view.helperLabel.text == helperText ).to(beTrue())
                }
            }
        }
    }
}
