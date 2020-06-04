//
//  TagViewController.swift
//  AndesUI-demoapp
//
//  Created by Samuel Sainz on 5/29/20.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import UIKit
import AndesUI

protocol TagView: NSObject {

}

class TagViewController: UIViewController, TagView {

    @IBOutlet weak var tagView: AndesTagSimple!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tagView.text = "Andes"
        tagView.isDismissible = true
        tagView.size = .small
        tagView.type = .error
    }
}
