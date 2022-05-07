//
//  HomeVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/22.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class HomeVC: BaseVC {
    
    // MARK: - Properties
    
    let viewModel = HomeViewModel()
    
    private let navigationBar = CustomNavigationBar()
        .addLeftButtonItem(image: ImageLiterals.Home.addIcon!)
        .addLeftButtonItem(image: ImageLiterals.Home.unlikeIcon!)
        .addLeftButtonItem(image: ImageLiterals.Home.shareIcon!)
        .addLeftButtonAction {
            print(1)
        }
        .addLeftButtonAction {
            print(2)
        }
        .addLeftButtonAction {
            print(3)
        }
        .leftButtonSpacing(16)
        .build()
    
    private let instaLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = ImageLiterals.Home.instagram_small
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var homeTableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        tv.clipsToBounds = true
        tv.allowsSelection = false
        return tv
    }()
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        bind()
    }
    
    // MARK: - Bind
    
    override func bind() {
        let input = HomeViewModel.Input()
        
        let output = self.viewModel.transform(from: input, disposeBag: disposeBag)
        
        viewModel.contentList
            .bind(to: homeTableView.rx.items) { (tableView,index,item) -> UITableViewCell in
                switch(item.case){
                case .story:
                    let storyData = item as! Home.StoryDataModel
                    guard let storyListCell = tableView.dequeueReusableCell(withIdentifier: StoryListTVC.className) as? StoryListTVC else {return UITableViewCell() }
                    storyListCell.bind(data: storyData)
                    return storyListCell
                    
                case .post:
                    let postData = item as! Home.PostDataModel
                    guard let homePostCell = tableView.dequeueReusableCell(withIdentifier: HomePostTVC.className) as? HomePostTVC else {return UITableViewCell() }
                    homePostCell.setData(data: postData)
                    homePostCell.likeButtonTapped
                        .bind {
                            self.viewModel.fetchLike(index: Int, selected: $0)
                        }.disposed(by: self.disposeBag)
                    homePostCell.contentView.isUserInteractionEnabled = false
                    return homePostCell
                }
            }.disposed(by: disposeBag)
    }
    
    // MARK: - Custom Methods
    
    private func registerCell() {
        StoryListTVC.register(target: homeTableView)
        HomePostTVC.register(target: homeTableView)
        
        homeTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    // MARK: - UI & Layout
    
    override func initialize() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        
        view.backgroundColor = .white
    }
    
    // Builder 패턴 적용한 커스텀 내비바
    override func configUI() {

    }
    
    override func setLayout() {
        view.addSubviews(navigationBar, homeTableView)
        
        navigationBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        navigationBar.addSubviews(instaLogoImageView)
        
        instaLogoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
        }
        
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 84
        } else {
            return UITableView.automaticDimension
        }
    }
}
