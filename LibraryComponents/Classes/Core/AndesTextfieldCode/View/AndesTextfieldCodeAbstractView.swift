//
//  AndesTextfieldCodeAbstractView.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

class AndesTextfieldCodeAbstractView: UIControl, AndesTextfieldCodeProtocol {

    @IBOutlet weak var andesCodeTextFieldView: UIView!

    internal var config: AndesTextFieldCodeViewConfig
//    internal var backgroundLayer: CALayer

//    override public var frame: CGRect {
//        didSet {
//               buttonView?.frame = frame
//           }
//    }

    internal init(config: AndesTextFieldCodeViewConfig) {
        self.config = config
//        self.backgroundLayer = CALayer()
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesTextFieldCodeViewConfig(label: "Label", helpLabel: "HelpLabel", style: "threesome")
//        self.backgroundLayer = CALayer()
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
//        updateView()

        clipsToBounds = true
//        codeTextFieldView.clipsToBounds = true
//        codeTextFieldView2.clipsToBounds = true
//        codeTextFieldView3.clipsToBounds = true
//        threesomeCodeTextFieldView.clipsToBounds = true

    }

    func pinXibViewToSelf() {
//        addSubview(codeTextFieldView)
//        codeTextFieldView.translatesAutoresizingMaskIntoConstraints = false
//        leadingAnchor.constraint(equalTo: codeTextFieldView.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: codeTextFieldView.trailingAnchor).isActive = true
//        topAnchor.constraint(equalTo: codeTextFieldView.topAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: codeTextFieldView.bottomAnchor).isActive = true

//        addSubview(codeTextFieldView2)
//        codeTextFieldView2.translatesAutoresizingMaskIntoConstraints = false
//        leadingAnchor.constraint(equalTo: codeTextFieldView2.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: codeTextFieldView2.trailingAnchor).isActive = true
//        topAnchor.constraint(equalTo: codeTextFieldView2.topAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: codeTextFieldView2.bottomAnchor).isActive = true

//        addSubview(codeTextFieldView3)
//        codeTextFieldView3.translatesAutoresizingMaskIntoConstraints = false
//        leadingAnchor.constraint(equalTo: codeTextFieldView3.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: codeTextFieldView3.trailingAnchor).isActive = true
//        topAnchor.constraint(equalTo: codeTextFieldView3.topAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: codeTextFieldView3.bottomAnchor).isActive = true

        //***funciona perfecto
        addSubview(andesCodeTextFieldView)
        andesCodeTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: andesCodeTextFieldView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: andesCodeTextFieldView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: andesCodeTextFieldView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: andesCodeTextFieldView.bottomAnchor).isActive = true
        //***

//        addSubview(label)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
//        trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
//        topAnchor.constraint(equalTo: label.topAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    func update(withConfig config: AndesTextFieldCodeViewConfig) {
        print("hola")
    }
}
