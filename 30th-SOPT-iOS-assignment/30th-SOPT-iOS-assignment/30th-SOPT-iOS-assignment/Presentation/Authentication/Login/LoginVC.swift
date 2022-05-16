//
//  LoginVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class LoginVC: BaseVC {
    
    // MARK: - Properties
    
    let viewModel = LoginViewModel()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = ImageLiterals.Authetication.instaBlackLogo
        return iv
    }()
    
    private let emailTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.setPlaceHolder(placeHolder: "sopt_iOS")
        tf.setClearButton()
        return tf
    }()
    
    private let passwordTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.setPlaceHolder(placeHolder: "hello_iOS")
        tf.setEyeButton()
        return tf
    }()
    
    private lazy var passwordLoseButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        bt.setTitleColor(UIColor.systemBlue, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 13)
        return bt
    }()
    
    private lazy var loginButton: AuthButton = {
        let bt = AuthButton()
        bt.setTitle("로그인", for: .normal)
        bt.addAction(UIAction(handler: { _ in
            self.presentWelcomeVC()
        }), for: .touchUpInside)
        bt.isEnabled = false
        return bt
    }()
    
    private let registrationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "계정이 없으신가요?"
        lb.textColor = .lightGray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private lazy var registrationButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("가입하기", for: .normal)
        bt.setTitleColor(UIColor.systemBlue, for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 14)
        bt.addAction(UIAction(handler: { _ in
            self.pushUsernameVC()
        }), for: .touchUpInside)
        return bt
    }()
    
    private lazy var registrationStackView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.addArrangedSubview(registrationLabel)
        st.addArrangedSubview(registrationButton)
        st.spacing = 3
        return st
    }()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resetUI()
    }
    
    // MARK: - Bind
    
    override func bind() {
        let input = LoginViewModel.Input(
            emailTextFieldDidChange: emailTextField.rx.text.orEmpty.asObservable(),
            passwordTextFieldDidChange: passwordTextField.rx.text.orEmpty.asObservable()
        )
        
        let output = self.viewModel.transform(from: input, disposeBag: self.disposeBag)
        
        output.loginButtonEnable
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { [weak self] isEnabled in
                self?.loginButton.isEnabled = isEnabled
            })
            .disposed(by: disposeBag)
        
        output.clearButtonHidden
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { [weak self] isHidden in
                self?.emailTextField.setClearButton(hidden: isHidden)
            })
            .disposed(by: disposeBag)
        
        emailTextField.clearButtonTapped
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { [weak self] isEnabled in
                self?.loginButton.isEnabled = isEnabled
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Custom Methods
    
    private func presentWelcomeVC() {
        // TODO: - 동일 택필에서 email 형식인지 username 형식인지 판단하는 비즈니스 로직 뷰모델에 작성하기
        AuthService.shared.requestSignIn(email: "sopt", pw: "sopt123") { <#NetworkResult<Any>#> in
            <#code#>
        }
//        let nextVC = WelcomeVC(user: User(email: "",
//                                          username: emailTextField.text,
//                                          password: passwordTextField.text))
//        nextVC.modalPresentationStyle = .fullScreen
//        self.present(nextVC, animated: true)
    }
    
    private func pushUsernameVC() {
        let nextVC = UsernameVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    internal func resetUI() {
        emailTextField.text = ""
        passwordTextField.text = ""
        loginButton.isEnabled = false
    }
    
    // MARK: - UI & Layout
    
    override func initialize() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    override func setLayout() {
        view.addSubviews(logoImageView, emailTextField, passwordTextField,
                         passwordLoseButton, loginButton, registrationStackView)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(122)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
        }
        
        passwordLoseButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordLoseButton.snp.bottom).offset(33)
        }
        
        registrationStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(33)
        }
    }
}
