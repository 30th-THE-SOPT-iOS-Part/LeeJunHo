//
//  ShopVC.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/04/22.
//

import UIKit

final class ShopVC: BaseVC {
    
    // MARK: - Properties
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    // MARK: - UI & Layout
    
    override func initialize() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        
        view.backgroundColor = .magenta
    }
}
