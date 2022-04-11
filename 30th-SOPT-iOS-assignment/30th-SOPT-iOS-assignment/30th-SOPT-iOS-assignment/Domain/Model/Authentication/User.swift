//
//  User.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import Foundation

struct User {
    let email: String
    let username: String
    let password: String
    
    init(email: String?, username: String?, password: String?) {
        self.email = email ?? ""
        self.username = username ?? ""
        self.password = password ?? ""
    }
}
