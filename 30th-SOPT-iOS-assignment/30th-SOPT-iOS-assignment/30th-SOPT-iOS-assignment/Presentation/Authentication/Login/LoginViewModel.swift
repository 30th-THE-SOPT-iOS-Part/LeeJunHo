//
//  LoginViewModel.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import RxSwift
import RxCocoa

final class LoginViewModel {
    struct Input {
        let emailTextFieldDidChange: Observable<String>
        let passwordTextFieldDidChange: Observable<String>
    }

    struct Output {
        var loginButtonEnable = PublishSubject<Bool>()
    }

    // MARK: - Properties
    private var emailText: String = ""
    private var passwordText: String = ""

    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        return self.bind(input, disposeBag: disposeBag)
    }

    private func bind(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        input.emailTextFieldDidChange
            .subscribe(onNext: { [weak self] text in
                self?.emailText = text
                self?.activateLoginButton(output: output, emailText: text, passwordText: self?.passwordText ?? "")
            })
            .disposed(by: disposeBag)

        input.emailTextFieldDidChange
            .subscribe(onNext: { [weak self] text in
                self?.passwordText = text
                self?.activateLoginButton(output: output, emailText: self?.emailText ?? "", passwordText: text)
            })
            .disposed(by: disposeBag)

        return output
    }

    private func activateLoginButton(output: Output, emailText: String, passwordText: String) {

        if (!emailText.isEmpty && !passwordText.isEmpty) {
            output.loginButtonEnable.onNext(true)
        } else {
            output.loginButtonEnable.onNext(false)
        }
    }
}

//final class LoginViewModel {
//    struct Input {
//        let emailTextFieldDidChange: Observable<String>
//        let passwordTextFieldDidChange: Observable<String>
//    }
//
//    struct Output {
//        var loginButtonEnable = PublishSubject<Bool>()
//    }
//
//    // MARK: - Properties
//    private let loginUseCase = DefaultLoginUseCase()
//
//    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
//        self.configureInput(input, disposeBag: disposeBag)
//        return createOutput(from: input, disposeBag: disposeBag)
//    }
//
//    private func configureInput(_ input: Input, disposeBag: DisposeBag) {
//        input.emailTextFieldDidChange
//            .subscribe(onNext: { [weak self] text in
//                self?.loginUseCase.setEmailText(emailText: text)
//            })
//            .disposed(by: disposeBag)
//
//        input.passwordTextFieldDidChange
//            .subscribe(onNext: { [weak self] text in
//                self?.loginUseCase.setPasswordText(passwordText: text)
//            })
//            .disposed(by: disposeBag)
//    }
//
//    private func createOutput(from input: Input, disposeBag: DisposeBag) -> Output {
//        let output = Output()
//
//        loginUseCase.validationState
//            .asDriver(onErrorJustReturn: true)
//            .drive(onNext: { activation in
//                print(activation)
//                output.loginButtonEnable.onNext(activation)
//            })
//            .disposed(by: disposeBag)
//
//        return output
//    }
//}
