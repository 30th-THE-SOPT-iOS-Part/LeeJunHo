//
//  MainTabBar.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/22.
//

import UIKit

import RxSwift
import RxCocoa

final class MainTBC: UITabBarController {
    
    // MARK: Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        setTabBar()
        bind()
    }
    
    // MARK: Custom Methods
    
    private func setViewControllers() {
        let homeNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.homeIcon,
            selectedImage: ImageLiterals.MainTabBar.homeIcon_selected,
            rootViewController: HomeVC())
        
        let searchNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.searchIcon,
            selectedImage: ImageLiterals.MainTabBar.searchIcon_selected,
            rootViewController: SearchVC())
        
        let reelsNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.reelsIcon,
            selectedImage: ImageLiterals.MainTabBar.reelsIcon_selected,
            rootViewController: ReelsVC())
        
        let shopNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.shopIcon,
            selectedImage: ImageLiterals.MainTabBar.shopIcon_selected,
            rootViewController: ShopVC())
        
        let profileNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTabBar.profileIcon,
            selectedImage: ImageLiterals.MainTabBar.profileIcon_selected,
            rootViewController: ProfileVC())
        
        viewControllers = [homeNVC, searchNVC, reelsNVC, shopNVC, profileNVC]
    }
    
    private func setTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
    }
    
    private func bind() {
        self.rx.didSelect.asDriver()
            .drive(onNext: { vc in
                guard let index: Int = self.viewControllers?.firstIndex(of: vc) else { return }
                self.setTabBarStyle(by: index)
            })
            .disposed(by: disposeBag)
    }
    
    private func makeNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .clear
        nav.navigationBar.backgroundColor = .clear
        nav.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        nav.navigationItem.backBarButtonItem?.tintColor = .black
        return nav
    }
    
    private func setTabBarStyle(by selectedIndex: Int) {
        if(selectedIndex == 2) {
            tabBar.backgroundColor = .black
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        } else {
            tabBar.backgroundColor = .white
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
    }
}
