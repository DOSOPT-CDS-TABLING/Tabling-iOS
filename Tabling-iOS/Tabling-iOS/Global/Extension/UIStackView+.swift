//
//  UIStackView+.swift
//  Tabling-iOS
//
//  Created by 민 on 11/20/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
