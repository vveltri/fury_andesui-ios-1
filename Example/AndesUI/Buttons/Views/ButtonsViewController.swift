//
//  ButtonsViewController.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import UIKit

import AndesUI

class ButtonsViewController: UIViewController {

    @IBOutlet weak var andesButton: AndesButton!

    @IBOutlet weak var largeLoudAndesButton: AndesButton!
    @IBOutlet weak var largeQuietAndesButton: AndesButton!
    @IBOutlet weak var largeTransparentAndesButton: AndesButton!
    @IBOutlet weak var largeLoudLeftImageAndesButton: AndesButton!
    @IBOutlet weak var largeLoudRightImageAndesButton: AndesButton!

    @IBOutlet weak var largeQuietLeftImageAndesButton: AndesButton!
    @IBOutlet weak var largeQuietRightImageAndesButton: AndesButton!

    @IBOutlet weak var largeTransparentLeftImageAndesButton: AndesButton!
    @IBOutlet weak var largeTransparentRightImageAndesButton: AndesButton!

    @IBOutlet weak var mediumLoudAndesButton: AndesButton!
    @IBOutlet weak var mediumQuietAndesButton: AndesButton!
    @IBOutlet weak var mediumTransparentAndesButton: AndesButton!

    @IBOutlet weak var smallLoudAndesButton: AndesButton!
    @IBOutlet weak var smallQuietAndesButton: AndesButton!
    @IBOutlet weak var smallTransparentAndesButton: AndesButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationItem.title = "Buttons"

        andesButton.setText("Default")

        largeLoudAndesButton.setText("Large Loud")
        largeQuietAndesButton.setText("Large Quiet")
        largeTransparentAndesButton.setText("Large Transparent")

        largeLoudRightImageAndesButton.setText("Large Loud Right Icon")
        largeLoudLeftImageAndesButton.setText("Large Loud Left Icon")

        largeQuietRightImageAndesButton.setText("Large Quiet Right Icon")
        largeQuietLeftImageAndesButton.setText("Large Quiet Left Icon")

        mediumLoudAndesButton.setText("Medium Loud")
        mediumQuietAndesButton.setText("Medium Quiet")
        mediumTransparentAndesButton.setText("Medium Transparent")

        smallLoudAndesButton.setText("Small Loud")
        smallQuietAndesButton.setText("Small Quiet")
        smallTransparentAndesButton.setText("Small Transparent")

        func setupStyles() {
            // Loud quiet transparent
            largeLoudAndesButton.setStyle(.loud)
            largeQuietAndesButton.setStyle(.quiet)
            largeTransparentAndesButton.setStyle(.transparent)

            largeLoudLeftImageAndesButton.setStyle(.loud)
            largeLoudRightImageAndesButton.setStyle(.loud)

            largeQuietLeftImageAndesButton.setStyle(.quiet)
            largeQuietRightImageAndesButton.setStyle(.quiet)

            largeTransparentLeftImageAndesButton.setStyle(.transparent)
            largeTransparentRightImageAndesButton.setStyle(.transparent)

            mediumLoudAndesButton.setStyle(.loud)
            mediumQuietAndesButton.setStyle(.quiet)
            mediumTransparentAndesButton.setStyle(.transparent)

            smallLoudAndesButton.setStyle(.loud)
            smallQuietAndesButton.setStyle(.quiet)
            smallTransparentAndesButton.setStyle(.transparent)

        }

        func setupSizes() {
            // Large medium small
            largeLoudAndesButton.setSize(.large)

            largeQuietAndesButton.setSize(.large)
            largeTransparentAndesButton.setSize(.large)

            largeLoudRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "logo_global"), orientation: .left))
            largeLoudRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "logo_global"), orientation: .right))

            largeQuietLeftImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "logo_global"), orientation: .left))
            largeQuietRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "logo_global"), orientation: .right))

            largeTransparentLeftImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "logo_global"), orientation: .left))
            largeTransparentRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "logo_global"), orientation: .right))

            mediumLoudAndesButton.setSize(.medium)
            mediumQuietAndesButton.setSize(.medium)
            mediumTransparentAndesButton.setSize(.medium)

            smallLoudAndesButton.setSize(.small)
            smallQuietAndesButton.setSize(.small)
            smallTransparentAndesButton.setSize(.small)

        }

        setupStyles()
        setupSizes()
    }

}
