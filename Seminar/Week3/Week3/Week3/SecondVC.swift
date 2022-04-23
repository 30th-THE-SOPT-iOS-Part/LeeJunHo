//
//  SecondVC.swift
//  Week3
//
//  Created by Junho Lee on 2022/04/23.
//

import UIKit

protocol SecondVCDelegate: AnyObject {
    func sendData(data: String)
}

class SecondVC: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    weak var delegate: SecondVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendDataButtonDidTap(_ sender: Any) {
        if let text = dataTextField.text {
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
