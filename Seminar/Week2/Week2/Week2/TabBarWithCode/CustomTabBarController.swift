//
//  CustomTabBarController.swift
//  Week2
//
//  Created by Junho Lee on 2022/04/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarController()
    }
    
    func setTabBarController() {
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController"), let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else { return }
        
        firstViewController.tabBarItem = UITabBarItem(
            title: "First Tab",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        secondViewController.tabBarItem = UITabBarItem(
            title: "Second Tab",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        setViewControllers([firstViewController, secondViewController], animated: true)
    }
}
