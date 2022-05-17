//
//  WelcomeUseCase.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/09.
//

import RxSwift

protocol WelcomeUseCase {
    func requestSignUp(email: String, name: String, password: String) -> Observable<Int>
}

final class DefaultWelcomeUseCase: WelcomeUseCase {
    
    private let service = AuthService.shared
    
    internal func requestSignUp(email: String, name: String, password: String) -> Observable<Int> {
        return Observable.create { [weak self] observer -> Disposable in
            self?.service.requestSignUp(email: email, name: name, pw: password) { networkResult in
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

