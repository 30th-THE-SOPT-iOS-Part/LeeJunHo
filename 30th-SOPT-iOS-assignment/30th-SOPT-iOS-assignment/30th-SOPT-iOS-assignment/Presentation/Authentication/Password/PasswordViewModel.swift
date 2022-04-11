//
//  PasswordViewModel.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import RxSwift
import RxCocoa

final class PasswordViewModel {
    struct Input {
        let passwordTextFieldDidChange: Observable<String>
    }

    struct Output {
        var nextButtonEnabled = PublishRelay<Bool>()
    }

    // MARK: - Properties
    
    private let passwordUseCase: PasswordUseCase
    
    // MARK: - Initializer
    
    init() {
        passwordUseCase = DefaultPasswordUseCase()
    }
    
    // MARK: Methods

    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        self.configureInput(input, disposeBag: disposeBag)
        return createOutput(from: input, disposeBag: disposeBag)
    }

    private func configureInput(_ input: Input, disposeBag: DisposeBag) {
        input.passwordTextFieldDidChange
            .subscribe(onNext: { [weak self] text in
                self?.passwordUseCase.setPasswordText(passwordText: text)
            })
            .disposed(by: disposeBag)
    }

    private func createOutput(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        passwordUseCase.validationState
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { activation in
                output.nextButtonEnabled.accept(activation)
            })
            .disposed(by: disposeBag)

        return output
    }
}
