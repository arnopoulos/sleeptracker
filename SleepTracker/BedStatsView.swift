//
//  BedStatsView.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

//TODO: Add animations
class BedStatsView: UIView {

    var rangeInBed: TimeRangeView.DateRange? {
        didSet {
            timeInBed.range = rangeInBed
            updateProportions()
        }
    }
    var rangeAsleep: TimeRangeView.DateRange? {
        didSet {
            timeAsleep.range = rangeAsleep
            updateProportions()
        }
    }

    private let timeInBed: TimeRangeView = {
        let timeRange = TimeRangeView(alignment: .right)
        //TODO: Localize
        timeRange.title = "Time in bed"
        timeRange.tintColor = .customPurple
        return timeRange
    }()
    private let timeAsleep: TimeRangeView = {
        let timeRange = TimeRangeView(alignment: .left)
        //TODO: Localize
        timeRange.title = "Time Asleep"
        timeRange.tintColor = .customBlue
        return timeRange
    }()
    private let middle: BedStatsRatioView = BedStatsRatioView()
    private lazy var timeInBedHeightConstraint: NSLayoutConstraint = {
        return timeInBed.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor,
                                                  multiplier: 1.0)
    }()
    private lazy var timeAsleepHeightConstraint: NSLayoutConstraint = {
        return timeAsleep.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor,
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
        addSubview(timeInBed)
        addSubview(timeAsleep)
        addSubview(middle)

        //Explicitly using left and right anchors here because of localization issues that
        //would occur with right to left languages
        let constraints = [
            timeInBed.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            timeInBedHeightConstraint,
            timeInBed.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            timeInBed.rightAnchor.constraint(equalTo: middle.leftAnchor, constant: -16),

            middle.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor),
            middle.widthAnchor.constraint(equalToConstant: 40),
            middle.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            middle.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),

            timeAsleep.leftAnchor.constraint(equalTo: middle.rightAnchor, constant: 16),
            timeAsleep.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            timeAsleepHeightConstraint,
            timeAsleep.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func updateProportions() {
        let proportions = self.proportions()
        timeInBedHeightConstraint.isActive = false
        timeInBedHeightConstraint = timeInBed.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor,
                                                                      multiplier: proportions.inBed)
        timeInBedHeightConstraint.isActive = true
        middle.leftProportion = proportions.inBed

        timeAsleepHeightConstraint.isActive = false
        timeAsleepHeightConstraint = timeAsleep.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor,
                                                                        multiplier: proportions.asleep)
        timeAsleepHeightConstraint.isActive = true
        middle.rightProportion = proportions.asleep
    }

    private func proportions() -> (inBed: CGFloat, asleep: CGFloat) {
        guard let rangeInBed = rangeInBed, let rangeAsleep = rangeAsleep else {
            return (1.0, 1.0)
        }
        let inBedDelta = rangeInBed.begin.timeIntervalSince(rangeInBed.end)
        let asleepDelta = rangeAsleep.begin.timeIntervalSince(rangeAsleep.end)
        //Assuming that time in bed is never greater than time asleep
        //which might be the case if you can track sleep and bed time
        //independently
        return (1.0, CGFloat(asleepDelta / inBedDelta))
    }
    
}
