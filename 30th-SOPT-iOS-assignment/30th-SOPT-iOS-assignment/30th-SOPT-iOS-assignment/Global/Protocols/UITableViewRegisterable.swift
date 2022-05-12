//
//  UITableViewRegisterable.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import UIKit

protocol UITableViewRegisterable {
    static var isFromNib: Bool { get }
    static func register(target: UITableView)
}

extension UITableViewRegisterable where Self: UITableViewCell {
    static func register(target: UITableView) {
        if self.isFromNib {
          target.register(UINib(nibName: Self.className, bundle: nil), forCellReuseIdentifier: Self.className)
        } else {
            target.register(Self.self, forCellReuseIdentifier: Self.className)
        }
    }
}
