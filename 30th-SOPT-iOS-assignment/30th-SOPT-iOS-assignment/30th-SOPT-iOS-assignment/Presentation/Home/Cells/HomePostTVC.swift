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
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 12
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
    
    private let moreButton: UIButton = {
        let bt = UIButton()
        bt.setImage(ImageLiterals.Home.moreIcon, for: .normal)
        return bt
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let likeButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        bt.setImage(ImageLiterals.Home.likeIcon, for: .normal)
        return bt
    }()

    private let commentButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        bt.setImage(ImageLiterals.Home.commentIcon, for: .normal)
        return bt
    }()
    
    private let shareButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        bt.setImage(ImageLiterals.Home.shareIcon, for: .normal)
        return bt
    }()
    
    private lazy var contentButtonStackView: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.addArrangedSubview(likeButton)
        st.addArrangedSubview(commentButton)
        st.addArrangedSubview(shareButton)
        st.spacing = 4
        return st
    }()
    
    private let bookMarkButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        bt.setImage(ImageLiterals.Home.bookMarkIcon, for: .normal)
        return bt
    }()
    
    private let likeCountLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.textColor = .black
        lb.text = ""
        lb.textAlignment = .center
        lb.sizeToFit()
        return lb
    }()
    
    private let contentUsernameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.textColor = .black
        lb.text = ""
        lb.textAlignment = .center
        lb.sizeToFit()
        return lb
    }()
    
    private let contentLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.textColor = .black
        lb.text = ""
        lb.textAlignment = .center
        lb.sizeToFit()
        return lb
    }()
    
    private let moreCommentButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("댓글 10개 모두 보기", for: .normal)
        return bt
    }()
    
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
        
        updateLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
    }
    
    // MARK: - Methods
    
    func updateLayout(){
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    func setData(data: Home.PostDataModel) {
        profileImageView.image = UIImage(named: "\(data.userImage)")
        nameLabel.text = data.username
        contentUsernameLabel.text = data.username
        postImageView.image = UIImage(named: "\(data.postImage)")
    }
    
    // MARK: UI & Layout
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        addSubviews(profileImageView, nameLabel, moreButton,
                    postImageView, contentButtonStackView, bookMarkButton,
                    likeCountLabel, contentUsernameLabel, contentLabel,
                    moreCommentButton)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.equalToSuperview().inset(6)
            make.width.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.leading.equalTo(profileImageView.snp.trailing).offset(6)
        }
        
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(10)
            make.width.height.equalTo(24)
        }
        
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(12)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(300)
        }
        
        contentButtonStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(postImageView.snp.bottom).offset(8)
        }
        
        bookMarkButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(postImageView.snp.bottom).offset(8)
        }
        
        likeCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentButtonStackView.snp.leading)
            make.top.equalTo(contentButtonStackView.snp.bottom).offset(11)
        }
        
        contentUsernameLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeCountLabel.snp.leading)
            make.top.equalTo(likeCountLabel.snp.bottom).offset(5)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.leading.equalTo(likeCountLabel.snp.trailing).offset(4)
            make.centerY.equalTo(likeCountLabel.snp.centerY)
        }
        
        moreCommentButton.snp.makeConstraints { make in
            make.leading.equalTo(likeCountLabel.snp.leading)
            make.top.equalTo(contentUsernameLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview()
        }
    }
}

