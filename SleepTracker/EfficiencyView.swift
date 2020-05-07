//
//  EfficiencyView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/6/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class EfficiencyView: UIView {

    private enum Constants {
        static let fontSize: CGFloat = 20
        static let progressViewHeight: CGFloat = 5
        static let progressViewSpacing: CGFloat = 8
    }

    let progressView: ProgressView = ProgressView()

    private let titleLabel: UILabel = UILabel(fontSize: Constants.fontSize)
    private let accessoryView: UILabel = UILabel(fontSize: Constants.fontSize, weight: .bold)

    init(title: String, percentage: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        accessoryView.text = percentage
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(accessoryView)
        addSubview(progressView)
        addSubview(titleLabel)

        let constraints = [
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor),
            progressView.widthAnchor.constraint(equalTo: widthAnchor),
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressView.heightAnchor.constraint(equalToConstant: Constants.progressViewHeight),

            titleLabel.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -Constants.progressViewSpacing),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            accessoryView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -Constants.progressViewSpacing),
            accessoryView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
