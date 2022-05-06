//
//  HomeData.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import Foundation

protocol HomeContent {
  var `case`: Home.ContentList { get set }
}

struct Home{
  enum ContentList{
    case story
    case post
  }
  
  struct ContentData{
    var storyData: Home.StoryData?
    var postData: Home.PostData?
  }
}
