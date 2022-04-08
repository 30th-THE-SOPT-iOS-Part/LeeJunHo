//
//  LoginVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class LoginVC: BaseVC {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = ImageLiterals.Authetication.instaBlackLogo
        return iv
    }()
    
    private let emailTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.setPlaceHolder(placeHolder: "sopt_iOS")
        return tf
    }()
    
    private let passwordTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.setPlaceHolder(placeHolder: "hello_iOS")
        return tf
    }()
    
    private let loginButton: AuthButton = {
        let bt = AuthButton()
        bt.setTitle("로그인", for: .normal)
        return bt
    }()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Bind
    
    override func bind() {
    }
    
    // MARK: - @objc Methods
    
    // MARK: - UI & Layout
    
    override func setLayout() {
        view.addSubviews(logoImageView, emailTextField, passwordTextField,
                         loginButton)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(5)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
        }
    }
}

extension LoginVC {

}
