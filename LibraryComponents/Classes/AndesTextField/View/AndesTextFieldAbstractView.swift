//
//  AndesTextFieldAbstractView.swift
//  AndesUI
//
//  Created by Martin Damico on 12/03/2020.
//

import Foundation

class AndesTextFieldAbstractView: UIView, AndesTextFieldView {
    @IBOutlet weak var fieldView: UIView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var labelLabel: UILabel!
    @IBOutlet weak var helperLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var helperIconImageView: UIImageView!

    var borderLayer: CAShapeLayer?
    var text: String = ""
    weak var delegate: AndesTextFieldViewDelegate?

    var config: AndesTextFieldViewConfig
    init(withConfig config: AndesTextFieldViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesTextFieldViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesTextFieldViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(view)
        view.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()

        self.clipsToBounds = true
        self.fieldView.layer.borderWidth = 0
    }

    /// Override this method on each Message View to setup its unique components
    func updateView() {
        if let icon = config.helperIcon, !icon.isEmpty {
            helperIconImageView.isHidden = false
            AndesIconsProvider.loadIcon(name: icon, placeItInto: helperIconImageView)
            helperIconImageView.backgroundColor = config.helperIconBgColor
            helperIconImageView.tintColor = config.helperIconColor
        } else {
            helperIconImageView.isHidden = true
        }

        self.updateLabel(text: config.labelText, label: self.labelLabel, style: config.labelStyle)
        self.updateLabel(text: config.helperText, label: self.helperLabel, style: config.helperStyle)

        // update border
        updateBorder(dashed: config.textFieldBorderDashed, color: config.textFieldBorderColor, width: config.textFieldBorderWidth, radious: config.textFieldBorderRadious)
        fieldView.backgroundColor = config.inputBgColor
        // set counter label with right count
        var counterTxt: String?
        if config.counter > 0 {
            let length = self.text.count
            counterTxt = "\(length)/\(config.counter)"
        }
        self.updateLabel(text: counterTxt, label: self.counterLabel, style: config.counterStyle)
    }

    private func updateLabel(text: String?, label: UILabel, style: AndesFontStyle) {
        guard let txt = text, !txt.isEmpty else {
            label.text = ""
            label.isHidden = true
            return
        }
        label.text = txt
        label.isHidden = false
        label.setAndesStyle(style: style)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateBorder(dashed: config.textFieldBorderDashed, color: config.textFieldBorderColor, width: config.textFieldBorderWidth, radious: config.textFieldBorderRadious)
    }

    func updateBorder(dashed: Bool, color: UIColor, width: CGFloat, radious: CGFloat) {
        self.borderLayer?.removeFromSuperlayer()
        self.fieldView.layer.cornerRadius = radious
        if dashed {
            self.borderLayer = AndesTextFieldBorderLayerDashed(color: color, bounds: fieldView.bounds, width: width, radious: radious)
        } else {
            self.borderLayer = AndesTextFieldBorderLayerDefault(color: color, bounds: fieldView.bounds, width: width, radious: radious)
        }
        self.fieldView.layer.addSublayer(borderLayer!)
    }

    func clear() {
        self.text = ""
    }
}
