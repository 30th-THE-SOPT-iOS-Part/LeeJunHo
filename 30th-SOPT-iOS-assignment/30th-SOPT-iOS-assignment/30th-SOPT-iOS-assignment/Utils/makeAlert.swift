//
//  makeAlert.swift
//  30th-SOPT-iOS-assignment
//
//  Created by Junho Lee on 2022/05/17.
//

import UIKit

extension UIViewController {
    func makeAlert(title : String,
                   message : String? = nil,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        let alertViewController = UIAlertController(title: title, message: message,
                                                        preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        self.present(alertViewController, animated: true, completion: completion)
    }
}
