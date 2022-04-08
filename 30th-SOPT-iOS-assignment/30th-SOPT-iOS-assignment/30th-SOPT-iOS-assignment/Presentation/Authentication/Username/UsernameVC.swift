//
//  UserNameVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class UsernameVC: BaseVC {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "사용자 이름 만들기"
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    private let guideLabel: UILabel = {
        let lb = UILabel()
        lb.text = """
                  새 계정에 사용할 사용자 이름을 선택하세요. 나중에
                  언제든지 변경될 수 있습니다.
                  """
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.textColor = .gray
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private let usernameTextField: AuthTextField = {
        let tf = AuthTextField()
        tf.setPlaceHolder(placeHolder: "사용자 이름")
        return tf
    }()
    
    private lazy var nextButton: AuthButton = {
        let bt = AuthButton()
        bt.setTitle("다음", for: .normal)
        bt.isEnabled = false
        return bt
    }()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Bind
    
    override func bind() {
    }
    
    // MARK: - @objc Methods
    
    // MARK: - UI & Layout
    
    override func configUI() {
        
    }
    
    override func setLayout() {
        view.addSubviews(titleLabel, guideLabel, usernameTextField,
                         nextButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(guideLabel.snp.bottom).offset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
        }
    }
}

extension LoginVC {

}
