//
//  SotryListTVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

class StoryListTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib = false
    
    private var disposeBag = DisposeBag()
    
    private let guideImageView = UIImageView()
    
    private lazy var storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    // MARK: - View Life Cycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setLayout()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    // MARK: - Methods
    
    private func registerCell() {
        StoryCVC.register(target: storyCollectionView)
        
    }
    
    func bind(data: Home.StoryDataModel) {
        Observable.of(data.users)
            .bind(to: storyCollectionView.rx.items(
                cellIdentifier: StoryCVC.className, cellType: StoryCVC.self)) { (row, element, cell) in
                    cell.setData(username: element.username, userImage: element.userImage)
                }.disposed(by: disposeBag)
    }
    
    private func setLayout() {
        self.contentView.addSubview(storyCollectionView)
        
        storyCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
}

