//
//  QualityStatsView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/6/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class QualityStatsView: UIView {

    private enum Constants {
        static let fontSize: CGFloat = 20
        static let buttonRadius: CGFloat = 8
        static let margins = NSDirectionalEdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16)
        static let height: CGFloat = 50
        static let continueButtonWidth: CGFloat = 175
        static let continueButtonSpacing: CGFloat = 32
        static let defaultSpacing: CGFloat = 8
    }

    private let sleepEfficiencyView: EfficiencyView = {
        let efficiency = EfficiencyView(title: "Sleep efficiency", percentage: "75%")
        efficiency.progressView.progress = 0.75
        efficiency.progressView.tintColor = .customOrange
        return efficiency
    }()
    private let targetSleepEfficiencyView: EfficiencyView = {
        let efficiency = EfficiencyView(title: "Target Sleep efficiency", percentage: "85%+")
        efficiency.progressView.progress = 0.85
        efficiency.progressView.tintColor = .customGreen
        return efficiency
    }()
    private let sleepQualityLabel: UILabel = {
        let label = UILabel(fontSize: Constants.fontSize)
        label.text = "Sleep Quality"
        return label
    }()
    private let sleepQualityIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "smiley"))
        icon.tintColor = .customBlue
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    private let divider: UIView = UIView.divider()
    private let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customBlue
        button.layer.cornerRadius = Constants.buttonRadius
        button.setTitle("CONTINUE", for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        directionalLayoutMargins = Constants.margins

        addSubview(sleepEfficiencyView)
        addSubview(targetSleepEfficiencyView)
        addSubview(sleepQualityLabel)
        addSubview(sleepQualityIcon)
        addSubview(divider)
        addSubview(continueButton)

        let constraints = [
            continueButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            continueButton.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: Constants.height),
            //This will not work for localization
            continueButton.widthAnchor.constraint(equalToConstant: Constants.continueButtonWidth),

            divider.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -Constants.continueButtonSpacing),
            divider.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            divider.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),

            sleepQualityIcon.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            sleepQualityIcon.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -Constants.defaultSpacing),
            sleepQualityIcon.widthAnchor.constraint(equalToConstant: 30),
            sleepQualityIcon.heightAnchor.constraint(equalTo: sleepQualityIcon.widthAnchor),

            sleepQualityLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            sleepQualityLabel.centerYAnchor.constraint(equalTo: sleepQualityIcon.centerYAnchor),

            targetSleepEfficiencyView.bottomAnchor.constraint(equalTo: sleepQualityIcon.topAnchor, constant: -Constants.defaultSpacing),
            targetSleepEfficiencyView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            targetSleepEfficiencyView.heightAnchor.constraint(equalToConstant: Constants.height),
            targetSleepEfficiencyView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),

            sleepEfficiencyView.bottomAnchor.constraint(equalTo: targetSleepEfficiencyView.topAnchor,
                                                        constant: -Constants.defaultSpacing),
            sleepEfficiencyView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            sleepEfficiencyView.heightAnchor.constraint(equalToConstant: Constants.height),
            sleepEfficiencyView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
