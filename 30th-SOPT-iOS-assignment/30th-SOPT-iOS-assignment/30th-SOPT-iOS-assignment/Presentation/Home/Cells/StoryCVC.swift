//
//  StoryListCVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import UIKit

import SnapKit

final class StoryCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    
    // MARK: - View Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        profileImageView.image = UIImage()
    }
    
    /// 셀 초기화.
    func setData(username: String, userImage: String) {
        nameLabel.text = username
        profileImageView.image = UIImage(named: userImage)
    }
}

// MARK: - Methods

extension StoryCVC {
    private func setUI() {
        profileImageView.backgroundColor = .gray
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.gray.cgColor
        profileImageView.layer.cornerRadius = 30
        profileImageView.layer.masksToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 1
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.textAlignment = .center
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nameLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(4)
            make.centerX.equalTo(profileImageView.snp.centerX)
            make.width.equalTo(profileImageView.snp.width)
        }
    }
}
