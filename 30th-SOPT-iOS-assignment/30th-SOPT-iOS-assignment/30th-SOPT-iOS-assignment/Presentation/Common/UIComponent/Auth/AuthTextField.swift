//
//  AuthTextField.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import SnapKit

final class AuthTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func setPlaceHolder(placeHolder: String) {
        self.placeholder = placeHolder
    }
    
    // MARK: - Private Methods
    
    private func changeAppearance() {
        if isEnabled {
            backgroundColor = .systemBlue
        } else {
            backgroundColor = .systemBlue.withAlphaComponent(0.4)
        }
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        isSelected = false
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        backgroundColor = .lightGray.withAlphaComponent(0.8)
        layer.cornerRadius = 5
    }
    
    private func setLayout() {
        self.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 40)
            make.height.equalTo(50)
        }
    }
}

extension AuthButton {
    

}
