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

    func setupSizes() {
        // Large medium small
        largeLoudLeftImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "clip"), orientation: .left))
        largeLoudRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "clip"), orientation: .right))

        largeQuietLeftImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "clip"), orientation: .left))
        largeQuietRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "clip"), orientation: .right))

        largeTransparentLeftImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "clip"), orientation: .left))
        largeTransparentRightImageAndesButton.setLargeSizeWithIcon(AndesButtonIcon(icon: #imageLiteral(resourceName: "clip"), orientation: .right))

    }

    func setTexts() {
        navigationItem.title = "Buttons"
    }

    func setupUI() {
        setTexts()
        setupSizes()
    }
}
