//
//  BaseTargetType.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: String {
        return APIConstants.baseURL
    }
    
    var header: HeaderType {
        return HeaderType.auth
    }
}
