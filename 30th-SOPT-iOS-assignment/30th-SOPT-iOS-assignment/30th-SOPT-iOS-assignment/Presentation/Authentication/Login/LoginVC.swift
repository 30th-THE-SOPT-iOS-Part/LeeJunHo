//
//  LoginVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa

protocol LoginVCBindable {
    
}

class LoginVC: BaseVC<LoginVCBindable> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func bind(_ viewModel: LoginVCBindable) {
        print("hi")
    }
    
    override func configUI() {
        
    }
    
    override func setLayout() {
        
    }
}

extension LoginVC {

}
