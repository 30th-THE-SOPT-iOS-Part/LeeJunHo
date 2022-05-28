//
//  FirstViewController.swift
//  Seminar7
//
//  Created by Junho Lee on 2022/05/28.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fireOnTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("Fire"), object: self, userInfo: ["content": 3])
    }

    @IBAction func fireOffTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name:Notification.Name("FireOff"), object: self, userInfo: ["content": 4])
    }
}
