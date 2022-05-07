//
//  ViewController.swift
//  Week4-Moya
//
//  Created by Junho Lee on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getNetwork()
    }

    private func getNetwork() {
        BaseService.default.login(name: "김태현2", email: "iOS2@sopt.org", password: "123456") { result in
            result.success { [weak self] data in
                if let data = data{
                    self?.myLabel.text = data.email
                }
            }.catch {error in
                print("에러인뎁쇼?",error)
            }
        }
    }
}
