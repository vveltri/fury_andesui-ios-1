//
//  AndesCheckboxDefaultView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

class AndesCheckboxDefaultView: UIView, AndesCheckboxView {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var iconView: UIImageView!

    @IBOutlet var checkboxView: UIView!
    weak var delegate: AndesCheckboxViewDelegate?

    var config: AndesCheckboxViewConfig
    init(withConfig config: AndesCheckboxViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    func update(withConfig config: AndesCheckboxViewConfig) {
        self.config = config
        updateView()
    }

    func loadNib() {
           let bundle = AndesBundle.bundle()
           bundle.loadNibNamed("AndesCheckboxDefaultView", owner: self, options: nil)
    }

    override init(frame: CGRect) {
        config = AndesCheckboxViewConfig()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesCheckboxViewConfig()
        super.init(coder: coder)
        setup()

    }

    init() {
        config = AndesCheckboxViewConfig()
        super.init(frame: .zero)
        setup()
    }

    func setup() {
        loadNib()
        self.addSubview(checkboxView)
        checkboxView.pinToSuperview()
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        updateView()
    }

    func updateView() {
        self.label.text = config.title
        let checkboxIcon: String? = config.icon
        self.iconView.backgroundColor = config.backgroundColor
        if let currentIcon = checkboxIcon, !currentIcon.isEmpty {
            AndesIconsProvider.loadIcon(name: currentIcon, placeItInto: self.iconView)
        }
        //Setear la fonts
    }

}
