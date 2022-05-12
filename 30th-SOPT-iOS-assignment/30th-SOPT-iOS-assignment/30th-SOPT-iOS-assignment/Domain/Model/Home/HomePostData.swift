//
//  HomePostData.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import Foundation

extension Home{
    struct PostDataModel: HomeContent {
        var `case`: Home.ContentList = .post
        let username: String
        let userImage: String
        let postImage: String
        let postContent: String
        var likeCount: Int
        let commentCount: Int
        var liked: Bool
        
        static let sample: [PostDataModel] = [
            PostDataModel(username: "avatar1", userImage: "avatar1", postImage: "postImage1", postContent: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", likeCount: 13, commentCount: 3, liked: true),
            PostDataModel(username: "avatar2", userImage: "avatar2", postImage: "postImage2", postContent: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", likeCount: 151, commentCount: 33, liked: false),
            PostDataModel(username: "avatar3", userImage: "avatar3", postImage: "postImage3", postContent:  "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다.", likeCount: 2, commentCount: 7, liked: true),
            PostDataModel(username: "avatar4", userImage: "avatar4", postImage: "postImage4", postContent: "✨ 행동은 모든 성공의 가장 기초적인 핵심이다.", likeCount: 14, commentCount: 35, liked: false),
            PostDataModel(username: "avatar5", userImage: "avatar5", postImage: "postImage1", postContent: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", likeCount: 16, commentCount: 34, liked: false),
            PostDataModel(username: "avatar6", userImage: "avatar6", postImage: "postImage2", postContent: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", likeCount: 2, commentCount: 23, liked: true)
        ]
    }

    struct PostData {
        let username: String
        let userImage: String
        let postImage: String
        let postContent: String
        var likeCount: Int
        let commentCount: Int
        var liked: Bool
    }
}
