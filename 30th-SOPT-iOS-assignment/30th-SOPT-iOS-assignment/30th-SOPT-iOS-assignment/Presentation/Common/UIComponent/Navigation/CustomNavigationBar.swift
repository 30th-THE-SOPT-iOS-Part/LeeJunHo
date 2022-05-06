//
//  CustomNavigationBar.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/07.
//

import UIKit

import SnapKit

class CustomNavigationBar: UIView {
    
    // MARK: - Properties
    
    private var buttonCount = 0
    private var closureCount = 0
    
    private var leftButtonClosures: [(() -> Void)] = []
    private var buttonImages: [UIImage] = []
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private var leftButtonStack: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.spacing = 4
        return st
    }()
    
    // MARK: - Initialize
    
    // 코드베이스
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    // 스토리보드
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUI()
        setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel, leftButtonStack)
        
        self.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        leftButtonStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(14)
        }
    }
}

// MARK: Buildable Methods

extension CustomNavigationBar {
    
    @discardableResult
    func title(_ title: String) -> Self {
        titleLabel.text = title
        
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor) -> Self {
        self.titleLabel.textColor = color
        
        return self
    }

    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.titleLabel.font = font
        
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        
        return self
    }
    
    @discardableResult
    func leftButtonSpacing(_ spacing: CGFloat) -> Self {
        self.leftButtonStack.spacing = spacing
        
        return self
    }
    
    // MARK: Methods about adding Buttons
    
    @discardableResult
    func addLeftButtonItem(image: UIImage) -> Self {
        buttonImages.append(image)
        buttonCount += 1
        
        return self
    }
    
    @discardableResult
    func addLeftButtonAction(closure: (() -> Void)?) -> Self {
        self.leftButtonClosures.append(closure ?? { })
        
        closureCount += 1
        return self
    }
    
    @discardableResult
    func build() -> UIView {
        for i in 0...buttonCount-1 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            button.setImage(buttonImages[i], for: .normal)
            button.tag = i
            
            self.leftButtonStack.addArrangedSubview(button)
        }
        
        for i in 0...closureCount-1 where i<=buttonCount {
            if let button = leftButtonStack.subviews[i] as? UIButton {
                button.addTarget(self, action: #selector(leftButtonSelector), for: .touchUpInside)
            }
        }
        
        return self
    }
    
    // MARK: - @objc Mehotds
    
    @objc
    private func leftButtonSelector(sender: UIButton) {
        self.leftButtonClosures[sender.tag]()
    }
}
