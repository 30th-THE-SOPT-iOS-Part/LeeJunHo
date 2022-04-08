//
//  LoginUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import Foundation

import RxSwift

protocol LoginUseCase {
    var emailText: String { get set }
    var passwordText: String { get set }
    var validationState: PublishSubject<Bool> { get set }
    func setEmailText(emailText: String)
    func setPasswordText(passwordText: String)
    func activateLoginButton()
}

final class DefaultLoginUseCase: LoginUseCase {

    var emailText: String = ""
    
    var passwordText: String = ""
    
    var validationState = PublishSubject<Bool>()
        
    func setEmailText(emailText: String) {
        self.emailText = emailText
        self.activateLoginButton()
    }
    
    func setPasswordText(passwordText: String) {
        self.passwordText = passwordText
        self.activateLoginButton()
    }
    
    internal func activateLoginButton() {
        if (!emailText.isEmpty && !passwordText.isEmpty) {
            validationState.onNext(true)
        } else {
            validationState.onNext(false)
        }
    }
}
