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
    
    var baseURL: URL {
        return URL(string: Config.Network.baseURL)!
    }
    
    var headers: [String: String]? {
        if let token = UserDefaults.standard.value(forKey: Const.UserDefaultKey.token) {
            let header = [
                "content-Type": "applcation/json",
                "Authorization": "Bearer \(String(describing: token))"
            ]
            return header
        } else {
            let header = [
                "content-Type": "applcation/json"
            ]
            return header
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}
