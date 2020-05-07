//
//  GradientPillView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/6/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class GradientPillView: UIView {

    var gradient: [UIColor] = [] {
        didSet {
            gradientLayer.colors = gradient.map { $0.cgColor }
        }
    }

    override var layer: CALayer {
        return gradientLayer
    }

    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 1.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0)
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func layoutSubviews() {
        gradientLayer.frame = bounds
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        super.layer.addSublayer(gradientLayer)

        layer.masksToBounds = false
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 1
    }
}
