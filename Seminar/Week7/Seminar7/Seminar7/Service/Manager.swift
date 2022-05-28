//
//  Manager.swift
//  Seminar7
//
//  Created by Junho Lee on 2022/05/28.
//

import Foundation

final class TodoManager {
    // service code
    static let shared = TodoManager()
    private init() {}
}

extension TodoManager {
    func getTodoMock() -> [Todo] {
        return MockParser.load([Todo].self, from: "Todo")!
    }
}
