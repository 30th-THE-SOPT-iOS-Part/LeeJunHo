//
//  HeaderType.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation

enum HeaderType {
    case basic
    case withToken
    case multiPart
    case multiPartWithToken
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case accesstoken = "accesstoken"
}

enum HeaderContent: String {
    case json = "Application/json"
    case multiPart = "multipart/form-data"
    case tokenSerial = ""
}
