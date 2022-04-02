//
//  SecondViewController.swift
//  Week1
//
//  Created by Junho Lee on 2022/04/02.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func tapDismissVC(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapTransferData(_ sender: Any) {
        guard let rootVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        rootVC.message = textField.text
        let naviVC = UINavigationController(rootViewController: rootVC)
        
        self.present(naviVC, animated: true)
    }
}
