//
//  BedTimeView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

class BedTimeView: UIView {

    private enum Constants {
        static let headerBedStatsSpacing: CGFloat = 16
        static let margin = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    }

    private let header: UILabel = {
        let label = UILabel()
        label.text = "You've successfully saved your sleep entry for Sunday, Jan 6th"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let bedStats: BedStatsView = {
        let bedStats = BedStatsView()
        let timeAsleepBegin = Date()
        let timeAsleepEnd = timeAsleepBegin.addingTimeInterval(3600*7)
        bedStats.rangeAsleep = (timeAsleepBegin, timeAsleepEnd)

        let timeInBedBegin = Date()
        let timeInBedEnd = timeInBedBegin.addingTimeInterval(3600*8.5)
        bedStats.rangeInBed = (timeInBedBegin, timeInBedEnd)
        return bedStats
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
        directionalLayoutMargins = Constants.margin

        addSubview(header)
        addSubview(bedStats)

        header.translatesAutoresizingMaskIntoConstraints = false
        bedStats.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            header.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            header.widthAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.widthAnchor),
            header.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),

            bedStats.topAnchor.constraint(equalTo: header.bottomAnchor, constant: Constants.headerBedStatsSpacing),
            bedStats.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            bedStats.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            bedStats.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
