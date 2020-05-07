//
//  UIView+Extensions.swift
//  SleepTracker
//
//  Created by Andrew Arnopoulos on 5/5/20.
//  Copyright © 2020 Arnopoulos. All rights reserved.
//

import UIKit

extension UIView {
    static func divider() -> UIView {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        return divider
    }
}
