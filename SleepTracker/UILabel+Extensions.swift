//
//  UILabel+Extensions.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(fontSize: CGFloat, weight: UIFont.Weight = .regular) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
}
