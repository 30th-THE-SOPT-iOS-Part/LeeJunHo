//
//  LoginUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import RxSwift
import RxRelay

protocol LoginUseCase {
    var emailText: String { get set }
    var passwordText: String { get set }
    var loginButtonState: PublishRelay<Bool> { get set }
    var clearButtonState: PublishRelay<Bool> { get set }
    func setEmailText(emailText: String)
    func setPasswordText(passwordText: String)
    func activateLoginButton()
    func activateClearButton()
}

final class DefaultLoginUseCase: LoginUseCase {

    var emailText: String = ""
    
    var passwordText: String = ""
    
    var loginButtonState = PublishRelay<Bool>()
    
    var clearButtonState = PublishRelay<Bool>()
        
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
            loginButtonState.accept(false)
            return
        }
        
        guard !passwordText.isEmpty else {
            loginButtonState.accept(false)
            return
        }
        
        loginButtonState.accept(true)
    }
    
    internal func activateClearButton() {
        guard !emailText.isEmpty else {
            clearButtonState.accept(true)
            return
        }
        
        clearButtonState.accept(false)
    }
}
