//
//  ViewModelType.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/06.
//

import Foundation
import RxSwift

protocol ViewModelType{
  associatedtype Input
  associatedtype Output
  
  func transform(from input: Input, disposeBag: DisposeBag) -> Output
}
