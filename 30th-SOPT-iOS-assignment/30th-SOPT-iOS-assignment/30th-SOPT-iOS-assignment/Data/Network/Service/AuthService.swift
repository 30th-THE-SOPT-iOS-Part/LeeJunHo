//
//  AuthService.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation

import Alamofire

class AuthService: BaseService {
    static let shared = AuthService()
    
    private override init() {}
}

extension AuthService {
    
    func requestSignIn(email: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(AuthRouter.requestSignIn(email: email, pw: pw)).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return}
                let networkResult = self.judgeStatus(by: statusCode, data, type: SignIn.self, decodingMode: .message)
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func requestSignUp(email: String, name: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AF.request(AuthRouter.requestSignUp(email: email, name: name, pw: pw)).responseData { response in
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
