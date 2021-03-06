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
            PostDataModel(username: "avatar1", userImage: "avatar1", postImage: "postImage1", postContent: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.", likeCount: 13, commentCount: 3, liked: true),
            PostDataModel(username: "avatar2", userImage: "avatar2", postImage: "postImage2", postContent: "β° ν° λͺ©νλ₯Ό μ΄λ£¨κ³  μΆμΌλ©΄ νλ½μ κ΅¬νμ§ λ§λΌ", likeCount: 151, commentCount: 33, liked: false),
            PostDataModel(username: "avatar3", userImage: "avatar3", postImage: "postImage3", postContent:  "π± λ νλ λλ‘ νλ©΄ λ μ»λ κ²μ μ»λλ€.", likeCount: 2, commentCount: 7, liked: true),
            PostDataModel(username: "avatar4", userImage: "avatar4", postImage: "postImage4", postContent: "β¨ νλμ λͺ¨λ  μ±κ³΅μ κ°μ₯ κΈ°μ΄μ μΈ ν΅μ¬μ΄λ€.", likeCount: 14, commentCount: 35, liked: false),
            PostDataModel(username: "avatar5", userImage: "avatar5", postImage: "postImage1", postContent: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.", likeCount: 16, commentCount: 34, liked: false),
            PostDataModel(username: "avatar6", userImage: "avatar6", postImage: "postImage2", postContent: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.", likeCount: 2, commentCount: 23, liked: true)
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
