//
//  TargetType.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/15.
//

import Foundation
import Alamofire

protocol Router: URLRequestConvertible {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var header: HeaderType { get }
}

// MARK: asURLRequest()

extension Router {
    
    // URLRequestConvertible 구현
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = try URLRequest(url: url.appendingPathComponent(path), method: method)
        
        urlRequest = self.makeHeaderForRequest(to: urlRequest)
        
        return try self.makeParameterForRequest(to: urlRequest, with: url)
    }
    
    private func makeHeaderForRequest(to request: URLRequest) -> URLRequest {
        var request = request
        
        switch header {
            
        case .default:
            request.setValue(HeaderContent.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            
        case .withToken:
            request.setValue(HeaderContent.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.setValue(HeaderContent.tokenSerial.rawValue, forHTTPHeaderField: HTTPHeaderField.accesstoken.rawValue)
            
        case .multiPart:
            request.setValue(HeaderContent.multiPart.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            
        case .multiPartWithToken:
            request.setValue(HeaderContent.multiPart.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            request.setValue(HeaderContent.tokenSerial.rawValue, forHTTPHeaderField: HTTPHeaderField.accesstoken.rawValue)
        }
        
        return request
    }
    
    private func makeParameterForRequest(to request: URLRequest, with url: URL) throws -> URLRequest {
        var request = request
        
        switch parameters {
            
        case .query(let query):
            let params = query?.toDictionary() ?? [:]
            let queryParams = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            request.url = components?.url
            
        case .body(let body):
            let params = body?.toDictionary() ?? [:]
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .requestParameters(let requestParams):
            let params = requestParams
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        }
        
        return request
    }
}

// MARK: baseURL & header

extension Router {
    var baseURL: String {
        return URLConstants.baseURL
    }
    
    var header: HeaderType {
        return HeaderType.default
    }
}

// MARK: ParameterType

enum RequestParams {
    case query(_ parameter: Codable?)
    case body(_ parameter: Codable?)
    case requestParameters(_ parameter: [String : Any])
}

// MARK: toDictionary

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any] else { return [:] }
        return dictionaryData
    }
}
