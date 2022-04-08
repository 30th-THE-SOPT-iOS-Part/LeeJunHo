//
//  LoginUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import RxSwift

protocol LoginUseCase {
    var emailText: String { get set }
    var passwordText: String { get set }
    var loginButtonState: PublishSubject<Bool> { get set }
    var clearButtonState: PublishSubject<Bool> { get set }
    func setEmailText(emailText: String)
    func setPasswordText(passwordText: String)
    func activateLoginButton()
    func activateClearButton()
}

final class DefaultLoginUseCase: LoginUseCase {

    var emailText: String = ""
    
    var passwordText: String = ""
    
    var loginButtonState = PublishSubject<Bool>()
    
    var clearButtonState = PublishSubject<Bool>()
        
    internal func setEmailText(emailText: String) {
        self.emailText = emailText
        self.activateLoginButton()
        self.activateClearButton()
    }
    
    internal func setPasswordText(passwordText: String) {
        self.passwordText = passwordText
        self.activateLoginButton()
    }
    
    internal func activateLoginButton() {
        guard !emailText.isEmpty else {
            loginButtonState.onNext(false)
            return
        }
        
        guard !passwordText.isEmpty else {
            loginButtonState.onNext(false)
            return
        }
        
        loginButtonState.onNext(true)
    }
    
    internal func activateClearButton() {
        guard !emailText.isEmpty else {
            clearButtonState.onNext(true)
            return
        }
        
        clearButtonState.onNext(false)
    }
}
