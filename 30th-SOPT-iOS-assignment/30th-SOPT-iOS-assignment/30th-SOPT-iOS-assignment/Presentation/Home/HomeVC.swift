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
    
    private lazy var homeTableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .white
        tv.clipsToBounds = true
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
        
        output.contentList
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
    
    override func setLayout() {
        view.addSubviews(homeTableView)
        
        homeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func configUI() {
        
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 84
        } else {
            return 450
        }
    }
}
