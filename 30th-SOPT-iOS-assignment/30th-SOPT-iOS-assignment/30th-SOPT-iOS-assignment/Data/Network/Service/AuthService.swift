//
//  AuthService.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation
import Alamofire

enum AuthService {
    case requestSignUp(email: String, name: String, pw: String)
    case requestSignIn(email: String, pw: String)
}

extension AuthService: BaseTargetType {
    
    var path: String {
        switch self {
        case .requestSignUp:
            return "/auth/signup"
        case .requestSignIn:
            return "/auth/signin"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .requestSignUp, .requestSignIn:
            return .post
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .requestSignUp(let email, let name, let pw):
            let body: [String : Any] = [
                "email": email,
                "name": name,
                "password": pw
            ]
            return .requestParameters(body)
        case .requestSignIn(let email, let pw):
            let body: [String : Any] = [
                "email": email,
                "password": pw
            ]
            return .requestParameters(body)
        }
    }
}
