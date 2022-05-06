//
//  HomePostTVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import UIKit

import SnapKit

class HomePostTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    private let guideImageView = UIImageView()
    
    // MARK: - View Life Cycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    // MARK: - Methods
    
    func setData(data: Home.PostDataModel) {
        guideImageView.image = UIImage(named: "\(data.postImage)")
    }
    
    private func setUI() {
        guideImageView.contentMode = .scaleAspectFill
    }
    
    private func setLayout() {
        self.addSubview(guideImageView)
        
        guideImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(300)
        }
    }
}

