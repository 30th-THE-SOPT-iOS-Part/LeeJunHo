//
//  UsernameUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/09.
//

import RxSwift
import RxCocoa

protocol UsernameUseCase {
    var usernameText: String { get set }
    var validationState: PublishRelay<Bool> { get set }
    func setUsernameText(usernameText: String)
    func activateNextButton()
}

final class DefaultUsernameUseCase: UsernameUseCase {

    var usernameText: String = ""
    
    var validationState = PublishRelay<Bool>()
        
    func setUsernameText(usernameText: String) {
        self.usernameText = usernameText
        self.activateNextButton()
    }
    
    internal func activateNextButton() {
        guard !usernameText.isEmpty else {
            validationState.accept(false)
            return
        }
        
        validationState.accept(true)
    }
}
