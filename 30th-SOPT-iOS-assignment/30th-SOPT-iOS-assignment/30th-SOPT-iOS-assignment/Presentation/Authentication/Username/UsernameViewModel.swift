//
//  UserNameViewModel.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import RxSwift
import RxCocoa

// MARK: - Usecase 이용 뷰모델
final class UsernameViewModel {
    struct Input {
        let usernameTextFieldDidChange: Observable<String>
    }

    struct Output {
        var nextButtonEnabled = PublishRelay<Bool>()
    }

    // MARK: - Properties
    
    private let usernameUseCase: UsernameUseCase
    
    // MARK: - Initializer
    
    init() {
      usernameUseCase = DefaultUsernameUseCase()
    }
    
    // MARK: Methods
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        self.configureInput(input, disposeBag: disposeBag)
        return createOutput(from: input, disposeBag: disposeBag)
    }

    private func configureInput(_ input: Input, disposeBag: DisposeBag) {
        input.usernameTextFieldDidChange
            .subscribe(onNext: { [weak self] text in
                self?.usernameUseCase.setUsernameText(usernameText: text)
            })
            .disposed(by: disposeBag)
    }

    private func createOutput(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        usernameUseCase.validationState
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { activation in
                output.nextButtonEnabled.accept(activation)
            })
            .disposed(by: disposeBag)

        return output
    }
}

