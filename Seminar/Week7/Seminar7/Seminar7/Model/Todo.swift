//
//  Todo.swift
//  Seminar7
//
//  Created by Junho Lee on 2022/05/28.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
