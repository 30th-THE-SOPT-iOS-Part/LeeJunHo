//
//  HomeStoryData.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import Foundation

extension Home{
    struct StoryDataModel: HomeContent {
        var `case`: Home.ContentList = .story
        let users: [usersData]

        static let sample: StoryDataModel = StoryDataModel(users: [Home.usersData(username: "avatar1", userImage: "avatar1"), Home.usersData(username: "avatar2", userImage: "avatar2"), Home.usersData(username: "avatar3", userImage: "avatar3"), Home.usersData(username: "avatar4", userImage: "avatar4"), Home.usersData(username: "avatar5", userImage: "avatar5"), Home.usersData(username: "avatar6", userImage: "avatar6")]
        )
    }
    
    struct usersData {
        var username: String
        var userImage: String
    }
    
    struct StoryData {
        var username: String
        var userImage: String
    }
}
