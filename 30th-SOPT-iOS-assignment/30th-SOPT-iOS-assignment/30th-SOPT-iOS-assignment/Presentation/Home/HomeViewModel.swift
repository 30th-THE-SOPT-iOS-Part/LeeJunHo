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

        // output만들 필요 없지만...
        return output
    }
    
    func fetchLike(index: Int, selected: Bool) {
        var prevData = contentList.value
        guard let storyData = prevData.first else { return }
        prevData.removeFirst()
        guard var postData = prevData as? [Home.PostDataModel] else { return }
        
        postData[index-1].liked.toggle()
        switch selected {
        case true:
            postData[index-1].likeCount -= 1
        case false:
            postData[index-1].likeCount += 1
        }
        
        var newContent: [HomeContent] = []
        
        newContent.append(storyData)
        newContent += postData
        
        contentList.accept(newContent)
        print(index)
    }
}
