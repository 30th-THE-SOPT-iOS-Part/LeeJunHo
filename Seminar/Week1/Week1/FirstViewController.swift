//
//  FirstViewController.swift
//  Week1
//
//  Created by Junho Lee on 2022/04/02.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func TapPresentVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        
        nextVC.modalPresentationStyle = .pageSheet

        self.present(nextVC, animated: true, completion: nil)
    }
}
