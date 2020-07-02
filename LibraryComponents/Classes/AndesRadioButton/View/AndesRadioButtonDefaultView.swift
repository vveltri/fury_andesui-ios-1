//
//  AndesRadioButtonDefaultView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation
class AndesRadioButtonDefaultView: UIView, AndesRadioButtonView {
    @IBOutlet weak var radioButtonRightBtn: UIButton!

    @IBOutlet weak var labelToLeftButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToRightButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelToTrailingConstraint: NSLayoutConstraint!

    @IBOutlet weak var rightBox: UIImageView!
    @IBOutlet weak var leftBox: UIImageView!

    @IBOutlet weak var radioButtonLabel: UILabel!

    @IBOutlet weak var radioButtonLeftBtn: UIButton!

    @IBOutlet var radioButtonView: UIView!

    weak var delegate: AndesRadioButtonViewDelegate?

    var config: AndesRadioButtonConfig

    init(withConfig config: AndesRadioButtonConfig) {
         self.config = config
         super.init(frame: .zero)
         setup()
     }

    override init(frame: CGRect) {
        self.config = AndesRadioButtonConfig()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesRadioButtonConfig()
        super.init(coder: coder)
        setup()

    }

    init() {
        self.config = AndesRadioButtonConfig()
        super.init(frame: .zero)
        setup()
    }

    @IBAction func rightBoxTapped(_ sender: Any) {
        delegate?.radioButtonTapped()
    }

    @IBAction func leftBoxTapped(_ sender: Any) {
        delegate?.radioButtonTapped()
    }

    func update(withConfig config: AndesRadioButtonConfig) {
          self.config = config
          updateView()
      }

      func loadNib() {
             let bundle = AndesBundle.bundle()
             bundle.loadNibNamed("AndesRadioButtonDefaultView", owner: self, options: nil)
      }

    func setup() {
        loadNib()
        self.addSubview(radioButtonView)
        radioButtonView.pinToSuperview()
        radioButtonView.translatesAutoresizingMaskIntoConstraints = false
        updateView()
    }

    func updateView() {
        clearView()
        self.radioButtonLabel.text = config.title
        setupButtonView()
        updateBoxesBorders()

        self.radioButtonLabel.setAndesStyle(style: AndesStyleSheetManager.styleSheet.bodyM(color: config.textColor))

    }

    func setupButtonView() {
        if config.align == .left {
            self.rightBox.isHidden = true
            self.leftBox.isHidden = false
            self.radioButtonRightBtn.isHidden = true
            self.radioButtonLeftBtn.isHidden = false
            self.leftBox.backgroundColor = config.backgroundColor
            self.leftBox.layer.cornerRadius = self.leftBox.frame.width/2
            self.labelToTrailingConstraint.priority = .defaultHigh
            self.labelToRightButtonConstraint.priority = .defaultLow
            self.labelToLeftButtonConstraint.priority = .defaultHigh
            self.labelToLeadingConstraint.priority = .defaultLow
        } else {
            self.rightBox.isHidden = false
            self.leftBox.isHidden = true
            self.radioButtonRightBtn.isHidden = false
            self.radioButtonLeftBtn.isHidden = true
            self.rightBox.backgroundColor = config.backgroundColor
            self.rightBox.layer.cornerRadius = self.rightBox.frame.width/2
            self.labelToTrailingConstraint.priority = .defaultLow
            self.labelToRightButtonConstraint.priority = .defaultHigh
            self.labelToLeftButtonConstraint.priority = .defaultLow
            self.labelToLeadingConstraint.priority = .defaultHigh
        }
    }

    func updateBoxesBorders() {
        if let currentBorderColor = config.borderColor, let currentBorderSize = config.borderSize {
            if !self.leftBox.isHidden {
                self.leftBox.layer.borderColor = currentBorderColor.cgColor
                self.leftBox.layer.borderWidth = currentBorderSize
            } else {
                self.rightBox.layer.borderColor = currentBorderColor.cgColor
                self.rightBox.layer.borderWidth = currentBorderSize
            }
        }
    }

    func clearView() {
        self.radioButtonLeftBtn.layer.borderColor = UIColor.clear.cgColor
        self.radioButtonRightBtn.layer.borderColor = UIColor.clear.cgColor
        self.radioButtonLeftBtn.layer.borderWidth = 0
        self.radioButtonRightBtn.layer.borderWidth = 0
        self.radioButtonLeftBtn.layer.backgroundColor = UIColor.clear.cgColor
        self.radioButtonRightBtn.layer.backgroundColor = UIColor.clear.cgColor
    }

}
