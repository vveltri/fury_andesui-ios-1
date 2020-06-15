//
//  AndesCheckboxDefaultView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

class AndesCheckboxDefaultView: UIView, AndesCheckboxView {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIView!

    @IBOutlet var checkboxView: UIView!
    weak var delegate: AndesCheckboxViewDelegate?

    func update(withConfig config: AndesCheckboxViewConfig) {
        //
    }

    func loadNib() {
           let bundle = AndesBundle.bundle()
           bundle.loadNibNamed("AndesCheckboxDefaultView", owner: self, options: nil)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()

    }

    init() {
        super.init(frame: .zero)
        setup()
    }

    func setup() {
        loadNib()
        checkboxView.pinToSuperview()
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hola"
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
