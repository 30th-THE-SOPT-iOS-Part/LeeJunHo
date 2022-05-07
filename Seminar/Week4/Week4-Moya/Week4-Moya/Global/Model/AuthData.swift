//
//  AuthData.swift
//  Week4-Moya
//
//  Created by Junho Lee on 2022/05/07.
//

struct AuthData: Codable {
    let name: String
    let email: String
  
  enum CodingKeys: String, CodingKey {
    case name, email
  }
}
