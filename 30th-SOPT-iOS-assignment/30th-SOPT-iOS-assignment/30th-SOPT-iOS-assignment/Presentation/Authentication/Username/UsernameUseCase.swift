//
//  UsernameUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/09.
//

import RxSwift

protocol UsernameUseCase {
    var usernameText: String { get set }
    var validationState: PublishSubject<Bool> { get set }
    func setUsernameText(usernameText: String)
    func activateNextButton()
}

final class DefaultUsernameUseCase: UsernameUseCase {

    var usernameText: String = ""
    
    var validationState = PublishSubject<Bool>()
        
    func setUsernameText(usernameText: String) {
        self.usernameText = usernameText
        self.activateNextButton()
    }
    
    internal func activateNextButton() {
        guard !usernameText.isEmpty else {
            validationState.onNext(false)
            return
        }
        
        validationState.onNext(true)
    }
}
