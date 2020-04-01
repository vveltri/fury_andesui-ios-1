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

    var dashedLayer: CAShapeLayer?
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

        // customize layer
        updateBorder(dashed: config.textFieldBorderDashed, color: config.textFieldBorderColor, width: config.textFieldBorderWidth, radious: config.textFieldBorderRadious)

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

    func getDashedLayer(color: UIColor, path: UIBezierPath, width: CGFloat, radious: CGFloat) -> CAShapeLayer {
        let dashedLayer = CAShapeLayer()
        dashedLayer.strokeColor = color.cgColor
        dashedLayer.lineDashPattern = [2, 2]
        dashedLayer.frame = fieldView.bounds
        dashedLayer.fillColor = nil
        dashedLayer.cornerRadius = radious
        dashedLayer.lineWidth = width
        dashedLayer.path = path.cgPath
        return dashedLayer
    }

    func updateBorder(dashed: Bool, color: UIColor, width: CGFloat, radious: CGFloat) {
        if dashed {
            let path = UIBezierPath(rect: fieldView.bounds)
            self.fieldView.layer.borderWidth = 0

            self.dashedLayer = getDashedLayer(color: color, path: path, width: width, radious: radious)
            self.fieldView.layer.addSublayer(dashedLayer!)
        } else {
            self.dashedLayer?.removeFromSuperlayer()
            self.fieldView.layer.borderColor = color.cgColor
            self.fieldView.layer.borderWidth = width
            self.fieldView.layer.cornerRadius = radious
        }
    }

    func clear() {
        self.text = ""
    }
}
