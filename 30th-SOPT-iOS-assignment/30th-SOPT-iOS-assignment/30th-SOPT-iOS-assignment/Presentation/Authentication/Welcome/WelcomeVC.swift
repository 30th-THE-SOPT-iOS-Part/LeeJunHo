//
//  WelcomeVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class WelcomeVC: BaseVC {
    
    // MARK: - Properties
    
    private let viewModel = WelcomeViewModel()
    
    private var user: User
    
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = """
                  \(user.username)님 Instagram에
                  오신 것을 환영합니다
                  """
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    private let guideLabel: UILabel = {
        let lb = UILabel()
        lb.text = """
                  언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다.
                  """
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.textColor = .gray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private lazy var completeButton: AuthButton = {
        let bt = AuthButton()
        bt.setTitle("완료하기", for: .normal)
        bt.isEnabled = true
        return bt
    }()
    
    private lazy var anotherAccountButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("다른 계정으로 로그인하기", for: .normal)
        bt.setTitleColor(UIColor.systemBlue, for: .normal)
        bt.addAction(UIAction(handler: { _ in
            self.popToLoginVC()
        }), for: .touchUpInside)
        bt.titleLabel?.font = .systemFont(ofSize: 13)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    // MARK: - Bind
    
    override func bind() {
        let input = WelcomeViewModel.Input(name: user.username,
                                           email: user.email,
                                           password: user.password,
                                           completeButtonTapped: completeButton.rx.tap.asObservable())
        
        let output = self.viewModel.transform(from: input, disposeBag: self.disposeBag)
        
        output.signUpResult
            .asDriver(onErrorJustReturn: 502)
            .drive(onNext: { [weak self] status in
                switch status {
                case 409:
                    self?.makeAlert(title: "회원가입 실패", message: "이미 존재하는 아이디입니다.")
                case 200:
                    self?.makeAlert(title: "회원가입 성공") { [weak self] UIAlertAction in
                        self?.popToLoginVC()
                    }
                default:
                    print("ServerErr")
                }
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Custom Methods
    
    private func popToLoginVC() {
        guard let naviVC = self.presentingViewController as? UINavigationController else { return }
        naviVC.popToRootViewController(animated: false)
        self.dismiss(animated: true)
    }
    
    // MARK: - UI & Layout
    
    override func configUI() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func setLayout() {
        view.addSubviews(titleLabel, guideLabel, completeButton,
                         anotherAccountButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(266)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
        }
        
        completeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(38)
            make.top.equalTo(guideLabel.snp.bottom).offset(23)
        }
        
        anotherAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(completeButton.snp.bottom).offset(18)
        }
    }
}
