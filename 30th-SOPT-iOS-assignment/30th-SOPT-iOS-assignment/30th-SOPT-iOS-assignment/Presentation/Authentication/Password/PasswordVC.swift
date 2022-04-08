//
//  PasswordVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class PasswordVC: BaseVC {
    
    // MARK: - Properties
    
    private var user: User
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "비밀번호 만들기"
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    private let guideLabel: UILabel = {
        let lb = UILabel()
        lb.text = """
                  비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인
                  정보를 입력하지 않아도 됩니다.
                  """
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.textColor = .gray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private let passwordTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.setPlaceHolder(placeHolder: "사용자 이름")
        return tf
    }()
    
    private lazy var nextButton: AuthButton = {
        let bt = AuthButton()
        bt.setTitle("다음", for: .normal)
        bt.addAction(UIAction(handler: { _ in
            self.presentWelcomeVC()
        }), for: .touchUpInside)
        bt.isEnabled = true
        return bt
    }()
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    override func bind() {
    }
    
    // MARK: - Custom Methods
    
    private func presentWelcomeVC() {
        let nextVC = WelcomeVC(user: User(email: user.email,
                                    username: user.username,
                                    password: passwordTextField.text))
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true)
    }
    
    // MARK: - @objc Methods
    
    // MARK: - UI & Layout
    
    override func configUI() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    override func setLayout() {
        view.addSubviews(titleLabel, guideLabel, passwordTextField,
                         nextButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(guideLabel.snp.bottom).offset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
    }
}
