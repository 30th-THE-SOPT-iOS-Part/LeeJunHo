//
//  MockParser.swift
//  Seminar7
//
//  Created by Junho Lee on 2022/05/28.
//

import Foundation

// 모델 타입과 json파일의 경로를 넣어주면 그에 맞춰 디코딩해줌
final class MockParser {
    static func load<D: Codable>(_ type: D.Type, from resourceName: String) -> D? {
        // Bundle에 대해서 알아보자
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            return nil
        }
        
        // String으로 가져오기
        guard let jsonString = try? String(contentsOfFile: path) else {
            return nil
        }
        
        print(jsonString)
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        print(data)
        
        guard let data = data else { return nil }
        return try? decoder.decode(type, from: data)
    }
}
