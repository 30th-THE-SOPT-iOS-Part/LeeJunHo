//
//  PasswordUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/09.
//

import RxSwift

protocol PasswordUseCase {
    var passwordText: String { get set }
    var validationState: PublishSubject<Bool> { get set }
    func setPasswordText(passwordText: String)
    func activateNextButton()
}

final class DefaultPasswordUseCase: PasswordUseCase {

    var passwordText: String = ""
    
    var validationState = PublishSubject<Bool>()
        
    func setPasswordText(passwordText: String) {
        self.passwordText = passwordText
        self.activateNextButton()
    }
    
    internal func activateNextButton() {
        guard !passwordText.isEmpty else {
            validationState.onNext(false)
            return
        }
        
        validationState.onNext(true)
    }
}
