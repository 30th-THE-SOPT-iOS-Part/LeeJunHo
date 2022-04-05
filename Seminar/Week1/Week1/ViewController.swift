//
//  ViewController.swift
//  Week1
//
//  Created by Junho Lee on 2022/04/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUI()
    }
    
    private func setUI() {
        if let message = message {
            messageLabel.text = message
            messageLabel.sizeToFit()
        }
    }
    
    @IBAction func tapPushVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PushedVC") else { return }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func doneButtonDidTap(_ sender: Any) {
        messageLabel.text = "메시지가 도착하지 않았습니다"
        messageLabel.textColor = .systemBlue
        messageLabel.sizeToFit()
        AudioServicesPlayAlertSound(1307)
    }
}

