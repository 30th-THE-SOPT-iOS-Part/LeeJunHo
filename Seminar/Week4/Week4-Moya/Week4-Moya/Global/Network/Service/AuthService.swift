//
//  AuthService.swift
//  Week4-Moya
//
//  Created by Junho Lee on 2022/05/07.
//

import Foundation
import Moya

protocol AuthServiceType {
    func login(name: String,
               email: String,
               password: String, completion: @escaping (Result<AuthData?, Error>) -> Void)
}

extension BaseService : AuthServiceType {
    func login(name: String,
               email: String,
               password: String, completion: @escaping (Result<AuthData?, Error>) -> Void) {
        requestObject(.postLogin(name: name, email: email, password: password), completion: completion)
    }
}
