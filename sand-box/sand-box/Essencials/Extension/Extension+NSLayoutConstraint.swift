//
//  Extension+NSLayoutConstraint.swift
//  sand-box
//
//  Created by Jonathan Rocha on 25/05/24.
//

import UIKit

public extension NSLayoutConstraint {
    @discardableResult func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
