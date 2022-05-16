//
//  AuthAPI.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation

import Alamofire

class AuthAPI: BaseAPI {
    static let shared = AuthAPI()
    
    private override init() {}
}

// MARK: - API
extension AuthAPI {
    
    func requestSignInAPI(email: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(AuthService.requestSignIn(email: email, pw: pw)).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return}
                let networkResult = self.judgeStatus(by: statusCode, data, type: SignIn.self)
                
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func requestSignUpAPI(email: String, name: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(AuthService.requestSignUp(email: email, name: name, pw: pw)).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return}
                let networkResult = self.judgeStatus(by: statusCode, data, type: SignUp.self)
                
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
