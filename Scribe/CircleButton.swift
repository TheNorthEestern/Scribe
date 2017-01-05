//
//  CircleButton.swift
//  Scribe
//
//  Created by Kacy James on 1/5/17.
//  Copyright © 2017 Student Driver. All rights reserved.
//

import UIKit

@IBDesignable class CircleButton : UIButton {
    @IBInspectable var cornerRadius: CGFloat = 20.0 {
        didSet {
            setupView()
        }
    }
}

extension CircleButton {
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.red.cgColor
    }
}
