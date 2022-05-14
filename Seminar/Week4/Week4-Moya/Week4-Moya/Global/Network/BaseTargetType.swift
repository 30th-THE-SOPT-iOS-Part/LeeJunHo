//
//  BaseTargetType.swift
//  Week4-Moya
//
//  Created by Junho Lee on 2022/05/07.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    
    var headers: [String: String]? {
        if let token = UserDefaults.standard.value(forKey: Const.UserDefaultKey.token) {
            let header = [
                "Content-Type" : "application/json",
                "Authorization" : "Bearer \(String(describing: token))"
            ]
            return header
        } else {
            let header = [
                "Content-Type" : "application/json"
            ]
            return header
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}
