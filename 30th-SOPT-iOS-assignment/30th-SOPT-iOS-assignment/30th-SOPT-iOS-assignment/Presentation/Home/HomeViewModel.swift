//
//  HomeViewModel.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import RxSwift
import RxCocoa

final class HomeViewModel: ViewModelType {
        
    struct Input {
        
    }

    struct Output {
        var contentList = BehaviorRelay<[HomeContent]>(value: [])
    }

    // MARK: - Properties
    
    var contentList = BehaviorRelay<[HomeContent]>(value: [])
    
    // MARK: - Initializer
    
    // MARK: Methods

    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        self.configureInput(input, disposeBag: disposeBag)
        var contentList: [HomeContent] = []
        
        contentList.append(Home.StoryDataModel.sample)
        contentList += Home.PostDataModel.sample
        
        self.contentList.accept(contentList)
        return createOutput(from: input, disposeBag: disposeBag)
    }

    private func configureInput(_ input: Input, disposeBag: DisposeBag) {

    }

    private func createOutput(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()

        var contentList: [HomeContent] = []
        
        contentList.append(Home.StoryDataModel.sample)
        contentList += Home.PostDataModel.sample
        
        output.contentList.accept(contentList)
        
        return output
    }
    
    func fetchLike(index: Int, selected: Bool) {
        var contentList: [HomeContent] = []
        
        if let content = self.contentList.value[0] as? Home.StoryDataModel {
            contentList.append(content)
        }
        if let content1 = self.contentList.value[] as? Home.StoryDataModel {
            contentList.append(content)
        }
    }
}
