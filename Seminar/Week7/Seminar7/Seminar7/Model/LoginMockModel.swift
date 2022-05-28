//
//  LoginMockModel.swift
//  Seminar7
//
//  Created by Junho Lee on 2022/05/28.
//

import Foundation

struct LoginMockModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let name: String
    let email: String
}
