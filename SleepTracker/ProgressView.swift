//
//  ProgressView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/6/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    var progress: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }

    override var tintColor: UIColor! {
        didSet {
            progressLayer.backgroundColor = tintColor.cgColor
        }
    }

    override var bounds: CGRect {
        didSet {
            setNeedsLayout()
        }
    }

    private let progressLayer: CALayer = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        layer.addSublayer(progressLayer)
    }

    override func setNeedsLayout() {
        super.setNeedsLayout()
        let size = CGSize(width: bounds.width * progress, height: bounds.height)
        progressLayer.frame = CGRect(origin: bounds.origin,
                                     size: size)
    }
}
