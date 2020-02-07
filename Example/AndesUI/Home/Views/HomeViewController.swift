//
//  HomeViewController.swift
//  AndesUI_Example
//
//  Created by Santiago Lazzari on 19/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import UIKit

import AndesUI

protocol HomeView: NSObject {

}

class HomeViewController: UIViewController {

    weak var presenter: HomePresenter!
    @IBOutlet weak var button: AndesButton!
    @IBOutlet weak var messagesBtn: AndesButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        func setupNavigation() {
            navigationItem.title = "AndesUI"
        }

        func setupButtons() {
            button.setText("Buttons")
            button.setSize(.large)

            messagesBtn.setText("Messages")
            button.setSize(.large)
        }

        setupNavigation()
        setupButtons()
    }

    @IBAction func goToButtonWasTapped(_ sender: Any) {
        presenter.presentButtons()
    }

    @IBAction func goToMessagesTapped(_ sender: Any) {
        presenter.presentMessages()
    }
}

extension HomeViewController: HomeView {

}
