//
//  WelcomeViewModel.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import RxSwift
import RxCocoa

final class WelcomeViewModel {
    
    struct Input {
        let name: String
        let email: String
        let password: String
        let completeButtonTapped: Observable<Void>
    }

    struct Output {
        var signUpResult: Observable<Int>
    }

    // MARK: - Properties
    
    private let welcomeUseCase: WelcomeUseCase
    
    // MARK: - Initializer
    
    init() {
      welcomeUseCase = DefaultWelcomeUseCase()
    }
    
    // MARK: Methods

    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        self.configureInput(input, disposeBag: disposeBag)
        return createOutput(from: input, disposeBag: disposeBag)
    }

    private func configureInput(_ input: Input, disposeBag: DisposeBag) {
        
    }

    private func createOutput(from input: Input, disposeBag: DisposeBag) -> Output {
        
        let signUpResult = input.completeButtonTapped
            .flatMap {
                return self.welcomeUseCase.requestSignUp(email: input.email, name: input.name, password: input.password)
            }
        
        let output = Output(signUpResult: signUpResult)

        return output
    }
}
