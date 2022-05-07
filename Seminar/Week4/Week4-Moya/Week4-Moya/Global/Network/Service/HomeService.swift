//
//  HomeService.swift
//  Week4-Moya
//
//  Created by Junho Lee on 2022/05/07.
//

import Foundation

protocol HomeServiceType {
    func getPopularTravelList(completion: @escaping (Result<[String]?, Error>) -> Void)
}

extension BaseService : HomeServiceType {
    func getPopularTravelList(completion: @escaping (Result<[String]?, Error>) -> Void) {
        requestObject(.getPopularTravelList, completion: completion)
    }
}
