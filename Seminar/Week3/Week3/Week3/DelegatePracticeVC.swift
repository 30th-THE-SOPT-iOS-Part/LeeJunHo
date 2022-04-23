//
//  DelegatePracticeVC.swift
//  Week3
//
//  Created by Junho Lee on 2022/04/23.
//

import UIKit

class DelegatePracticeVC: UIViewController, SecondVCDelegate {
    
    func sendData(data: String) {
        myLabel.text = data
    }
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setDelegate()
    }

    @IBAction func tapToPresentVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else { return }
        
        nextVC.delegate = self
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func setDelegate() {
        myTextField.delegate = self
    }

}

extension DelegatePracticeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("편집 시작")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("리턴키 눌림")
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("편집 종료")
    }
}
