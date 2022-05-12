//
//  ImageLiterals.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

struct ImageLiterals {
    
    struct Authetication {
        static let backIcon = UIImage(named: "icn_back_24")
        static let hiddenEyeIcon = UIImage(named: "password hidden eye icon")
        static let shownEyeIcon = UIImage(named: "password shown eye icon")
        
        static let instaBlackLogo = UIImage(named: "Instagram Black Logo")
    }
    
    struct MainTabBar {
        static let homeIcon = UIImage(named: "icn_home")
        static let homeIcon_selected = UIImage(named: "icn_home_selected")
        static let searchIcon = UIImage(named: "icn_search")
        static let searchIcon_selected = UIImage(named: "icn_search_selected")
        static let reelsIcon = UIImage(named: "icn_reels")
        static let reelsIcon_selected = UIImage(named: "icn_reels_selected")
        static let shopIcon = UIImage(named: "icn_shop")
        static let shopIcon_selected = UIImage(named: "icn_shop_selected")
        static let profileIcon: UIImage = {
            guard let image = UIImage(named: "icn_profile")?.withRenderingMode(.alwaysOriginal) else { return UIImage() }
            return image
        }()
        static let profileIcon_selected: UIImage = {
            guard let image = UIImage(named: "icn_profile_selected")?.withRenderingMode(.alwaysOriginal) else { return UIImage() }
            return image
        }()
    }
    
    struct Home {
        static let bookMarkIcon = UIImage(named: "icn_bookmark")
        static let commentIcon = UIImage(named: "icn_comment")
        static let likeIcon = UIImage(named: "icn_like")
        static let unlikeIcon = UIImage(named: "icn_unlike")
        static let moreIcon = UIImage(named: "icn_more")
        static let shareIcon = UIImage(named: "icn_share")
        static let addIcon = UIImage(named: "icn_add")
        
        static let instagram_small = UIImage(named: "logo_instagram_small")
    }
}
