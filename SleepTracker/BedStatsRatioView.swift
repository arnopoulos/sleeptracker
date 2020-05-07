//
//  BedStatsRatioView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class BedStatsRatioView: UIView {

    var leftProportion: CGFloat = 1.0 {
        didSet {
            leftViewHeightConstraint.isActive = false
            leftViewHeightConstraint = leftView.heightAnchor.constraint(equalTo: heightAnchor,
                                                                        multiplier: leftProportion)
            leftViewHeightConstraint.isActive = true
        }
    }

    var rightProportion: CGFloat = 1.0 {
        didSet {
            rightViewHeightConstraint.isActive = false
            rightViewHeightConstraint = rightView.heightAnchor.constraint(equalTo: heightAnchor,
                                                                          multiplier: rightProportion)
            rightViewHeightConstraint.isActive = true
        }
    }

    private let leftView: UIView = {
        let leftView = GradientPillView()
        leftView.gradient = [.customPurple, .customLightPurple]
        return leftView
    }()

    private let rightView: UIView = {
        let rightView = GradientPillView()
        rightView.gradient = [.customBlue, .customLightBlue]
        return rightView
    }()

    private lazy var leftViewHeightConstraint: NSLayoutConstraint = {
        return leftView.heightAnchor.constraint(equalTo: heightAnchor,
                                                multiplier: 1.0)
    }()

    private lazy var rightViewHeightConstraint: NSLayoutConstraint = {
        return rightView.heightAnchor.constraint(equalTo: heightAnchor,
                                                multiplier: 1.0)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(leftView)
        addSubview(rightView)

        let constraints = [
            leftView.leftAnchor.constraint(equalTo: leftAnchor),
            leftView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2 / 3),
            leftViewHeightConstraint,

            rightView.rightAnchor.constraint(equalTo: rightAnchor),
            rightView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2 / 3),
            rightViewHeightConstraint,
        ]

        NSLayoutConstraint.activate(constraints)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        leftView.layer.cornerRadius = leftView.frame.width / 2
        rightView.layer.cornerRadius = rightView.frame.width / 2
    }
}
