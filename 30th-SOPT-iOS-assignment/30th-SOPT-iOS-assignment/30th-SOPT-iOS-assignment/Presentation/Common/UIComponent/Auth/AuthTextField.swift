//
//  AuthTextField.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class AuthTextField: UITextField {
    enum Size {
        static let textFieldWidth: CGFloat = UIScreen.main.bounds.width - 40
    }
    
    var clearButtonTapped = PublishRelay<Bool>()
    
    private lazy var eyeButton: UIButton = {
        let bt = UIButton()
        
        // 심화과제
        bt.setImage(ImageLiterals.Authetication.shownEyeIcon, for: .normal)
        bt.setImage(ImageLiterals.Authetication.hiddenEyeIcon, for: .selected)
        bt.isSelected = true
        bt.addAction(UIAction(handler: { _ in
            bt.isSelected.toggle()
            self.isSecureTextEntry = bt.isSelected
        }), for: .touchUpInside)
        
        return bt
    }()
    
    private lazy var clearButton: UIButton = {
        let bt = UIButton()
        
        // 도전과제
        bt.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        bt.tintColor = .lightGray
        bt.addAction(UIAction(handler: { _ in
            self.text = ""
            self.clearButtonTapped.accept(false)
        }), for: .touchUpInside)
        
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    internal func setPlaceHolder(placeHolder: String) {
        self.placeholder = placeHolder
    }
    
    internal func setEyeButton() {
        let eyeButtonView = UIView()
        eyeButtonView.addSubview(eyeButton)
        eyeButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        rightViewMode = .always
        rightView = eyeButtonView
        rightView?.snp.makeConstraints({ make in
            make.width.height.equalTo(40)
        })
        isSecureTextEntry = true
        eyeButton.isHidden = false
    }
    
    internal func setClearButton() {
        let clearButtonView = UIView()
        clearButtonView.addSubview(clearButton)
        clearButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        rightView = clearButtonView
        rightView?.snp.makeConstraints({ make in
            make.width.height.equalTo(40)
        })
    }
    
    internal func setClearButton(hidden: Bool) {
        if hidden {
            rightViewMode = .never
        } else {
            rightViewMode = .whileEditing
        }
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        isSelected = false
        
        let leftSpacer = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftView = leftSpacer
        leftViewMode = .always
        
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 0.5
        backgroundColor = .lightGray.withAlphaComponent(0.1)
        layer.cornerRadius = 5
    }
    
    private func setLayout() {
        self.snp.makeConstraints { make in
            make.width.equalTo(Size.textFieldWidth)
            make.height.equalTo(50)
        }
    }
}
