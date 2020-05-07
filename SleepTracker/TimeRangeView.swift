//
//  TimeRangeView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class TimeRangeView: UIView {
    typealias DateRange = (begin: Date, end: Date)
    enum Alignment {
        case left
        case right
    }

    private enum Constants {
        static let margins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 8)
        static let hoursSpacing: CGFloat = 8
        static let hoursFontSize: CGFloat = 20
        static let fontSize: CGFloat = 16
    }

    override var tintColor: UIColor! {
        didSet {
            titleLabel.textColor = tintColor
            durationLabel.textColor = tintColor
        }
    }

    var range: DateRange? {
        didSet {
            let endTime: String
            let beginTime: String
            let duration: String
            if let (begin, end) = range {
                endTime = end.time
                beginTime = begin.time
                duration = begin.delta(to: end) ?? ""
            } else {
                endTime = ""
                beginTime = ""
                duration = ""
            }
            endLabel.text = endTime
            beginLabel.text = beginTime
            durationLabel.text = duration
        }
    }

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    //Keeping these views private to allow for the underlying
    //implementation to change without having to change the
    //consumers of TimeRangeView
    private let topDivider: UIView = UIView.divider()
    private let endLabel: UILabel = UILabel(fontSize: Constants.fontSize)
    private let titleLabel: UILabel = UILabel(fontSize: Constants.fontSize)
    private let durationLabel: UILabel = UILabel(fontSize: Constants.hoursFontSize, weight: .bold)
    private let beginLabel: UILabel = UILabel(fontSize: Constants.fontSize)
    private let bottomDivider: UIView = UIView.divider()
    private lazy var main: UIStackView = {
        let main = UIStackView(arrangedSubviews: [titleLabel, durationLabel])
        main.axis = .vertical
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }()

    //Assuming that alignment will not change after
    //initialization
    init(alignment: Alignment) {
        super.init(frame: .zero)
        setup(with: alignment)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(with alignment: Alignment) {
        translatesAutoresizingMaskIntoConstraints = false

        directionalLayoutMargins = Constants.margins

        addSubview(topDivider)
        addSubview(endLabel)
        addSubview(main)
        addSubview(beginLabel)
        addSubview(bottomDivider)

        let constraints = [
            topDivider.heightAnchor.constraint(equalToConstant: 1),
            topDivider.widthAnchor.constraint(equalTo: widthAnchor),
            topDivider.topAnchor.constraint(equalTo: topAnchor),
            topDivider.centerXAnchor.constraint(equalTo: centerXAnchor),

            endLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            main.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            beginLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

            bottomDivider.heightAnchor.constraint(equalToConstant: 1),
            bottomDivider.widthAnchor.constraint(equalTo: widthAnchor),
            bottomDivider.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomDivider.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]

        let directionalConstraints: [NSLayoutConstraint]
        switch alignment {
        case .left:
            directionalConstraints = [
                endLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
                main.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
                beginLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            ]
        case .right:
            directionalConstraints = [
                endLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
                main.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
                beginLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            ]
        }

        NSLayoutConstraint.activate(constraints + directionalConstraints)
    }


}
