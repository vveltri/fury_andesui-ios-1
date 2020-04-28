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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var messagesBtn: AndesButton!
    @IBOutlet weak var badgesBtn: AndesButton!
    @IBOutlet weak var welcomeMessage: AndesMessage!
    @IBOutlet weak var textFieldBtn: AndesButton!
    @IBOutlet weak var specsButton: AndesButton!
    @IBOutlet weak var contributingButton: AndesButton!
    @IBOutlet weak var showcaseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String {
            showcaseLabel.text = "\("home.label.showcase".localized) (v\(version))"
        }

        setupUI()
    }

    private func setupUI() {
        func setupNavigation() {
            navigationItem.title = "AndesUI"
        }

        func setupMessage() {
            welcomeMessage.setTitle("home.welcomeMsg.title".localized)
                .setBody("home.welcomeMsg.desc".localized)
                .setHierarchy(.quiet)
                .setPrimaryAction("home.welcomeMsg.action".localized, handler: { message in
                    self.presenter.presentWhatsNew()
                })
        }

        func setupButtons() {
            button.setText("Andes Button")
                .setSize(.large)

            messagesBtn.setText("Andes Message")
                .setSize(.large)

            badgesBtn.setText("Andes Badge")
                .setSize(.large)

            specsButton.setText("Andes Specs 📘")
                .setHierarchy(.quiet)
                .setSize(.large)

            contributingButton.setText("home.button.contribute.title".localized)
                .setHierarchy(.quiet)
                .setSize(.large)
            
            textFieldBtn.setText("Andes TextField")
            .setSize(.large)
        }

        setupNavigation()
        setupButtons()
        setupMessage()
    }

    @IBAction func goToButtonWasTapped(_ sender: Any) {
        presenter.presentButtons()
    }

    @IBAction func goToMessagesTapped(_ sender: Any) {
        presenter.presentMessages()
    }

    @IBAction func goToBadgesTapped(_ sender: Any) {
        presenter.presentBadges()
    }

    @IBAction func goToSpecsTapped(_ sender: Any) {
        guard let url = URL(string: "https://company-161429.frontify.com/d/kxHCRixezmfK/n-a") else { return }
        UIApplication.shared.open(url)

    }
    
    @IBAction func goToContributingTapped(_ sender: Any) {
        guard let url = URL(string: "https://meli.workplace.com/notes/andes-ui/c%C3%B3mo-contribuir-en-andes-ui/2559399620854933") else { return }
        UIApplication.shared.open(url)

    }
    
    @IBAction func textfieldBtnTapped(_ sender: Any) {
        presenter.presentTextField()
    }
}

extension HomeViewController: HomeView {

}
