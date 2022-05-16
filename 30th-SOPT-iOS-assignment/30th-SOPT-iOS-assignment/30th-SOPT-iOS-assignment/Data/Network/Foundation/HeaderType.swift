//
//  HeaderType.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation

enum HeaderType {
    case auth
    case authWithToken
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case accesstoken = "accesstoken"
}

enum ContentType: String {
    case json = "Application/json"
    case tokenSerial = ""
}
