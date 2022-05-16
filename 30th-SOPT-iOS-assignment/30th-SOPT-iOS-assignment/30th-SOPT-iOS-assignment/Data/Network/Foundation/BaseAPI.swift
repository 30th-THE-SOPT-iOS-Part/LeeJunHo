//
//  BaseAPI.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation

class BaseAPI {
    
    func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<T>.self, from: data)
        else { return .pathErr }
        switch statusCode {
        case 200:
            return .success(decodedData.data ?? "None-Data")
        case 400..<500:
            return .requestErr(decodedData.message ?? "Request-Err")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
