//
//  AuthButton.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/08.
//

import UIKit

import SnapKit

final class AuthButton: UIButton {
    
    // 도전과제
    override var isEnabled: Bool {
        didSet {
            changeAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 16)
        backgroundColor = .systemBlue
        layer.cornerRadius = 5
    }
    
    private func setLayout() {
        self.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.height.equalTo(44)
        }
    }
}
