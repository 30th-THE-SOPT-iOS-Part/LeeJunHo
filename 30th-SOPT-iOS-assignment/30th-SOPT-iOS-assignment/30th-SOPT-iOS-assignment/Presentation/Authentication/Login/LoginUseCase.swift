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
    func requestSignIn(email: String, password: String) -> Observable<Int>
}

final class DefaultLoginUseCase: LoginUseCase {
    
    var emailText: String = ""
    
    var passwordText: String = ""
    
    var loginButtonState = PublishRelay<Bool>()
    
    var clearButtonState = PublishRelay<Bool>()
    
    private let service = AuthService.shared
    
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
    
    internal func requestSignIn(email: String, password: String) -> Observable<Int> {
        return Observable.create { [weak self] observer -> Disposable in
            self?.service.requestSignIn(email: email, pw: password) { networkResult in
                switch networkResult {
                case .success:
                    observer.onNext(200)
                case .requestErr(let status):
                    if let status = status as? Int {
                        observer.onNext(status)
                    }
                case .pathErr:
                    observer.onNext(502)
                default: observer.onNext(502)
                }
            }
            return Disposables.create()
        }
    }
}

