//
//  UIStackView+.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/10.
//

import UIKit

extension UIStackView {
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
