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
        bt.addAction(UIAction(handler: { _ in
            self.tapToRootVC()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Custom Methods
    
    private func tapToRootVC() {
        guard let naviVC = self.presentingViewController as? UINavigationController else { return }
        naviVC.popToRootViewController(animated: false)
        self.dismiss(animated: true)
    }
    
    // MARK: - UI & Layout
    
    override func configUI() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func setLayout() {
        view.addSubviews(titleLabel, guideLabel, completeButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(250)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        completeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(guideLabel.snp.bottom).offset(30)
        }
    }
}
