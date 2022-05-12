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
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 24
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.textColor = .black
        lb.text = ""
        lb.numberOfLines = 1
        lb.lineBreakMode = .byTruncatingTail
        lb.textAlignment = .center
        return lb
    }()
    
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
    
    // MARK: Custom Methods
    
    func setData(username: String, userImage: String) {
        nameLabel.text = username
        profileImageView.image = UIImage(named: userImage)
    }
    
    // MARK: UI & Layout
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nameLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
    }
}
