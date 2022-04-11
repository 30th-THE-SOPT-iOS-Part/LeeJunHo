//
//  PasswordUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/09.
//

import RxSwift
import RxCocoa

protocol PasswordUseCase {
    var passwordText: String { get set }
    var validationState: PublishRelay<Bool> { get set }
    func setPasswordText(passwordText: String)
    func activateNextButton()
}

final class DefaultPasswordUseCase: PasswordUseCase {

    var passwordText: String = ""
    
    var validationState = PublishRelay<Bool>()
        
    func setPasswordText(passwordText: String) {
        self.passwordText = passwordText
        self.activateNextButton()
    }
    
    internal func activateNextButton() {
        guard !passwordText.isEmpty else {
            validationState.accept(false)
            return
        }
        
        validationState.accept(true)
    }
}
