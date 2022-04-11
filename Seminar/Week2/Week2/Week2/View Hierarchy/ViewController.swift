//
//  ViewController.swift
//  Week2
//
//  Created by Junho Lee on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var realButton: UIButton!
    private var secureButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        lockButton.setTitleColor(.systemPink, for: .normal)
        lockButton.tintColor = .systemPink

        
        realButton.setTitleColor(.blue, for: .normal)
        
        secureButton.setImage(UIImage(named: "password shown eye icon.png"), for: .selected)
        secureButton.setImage(UIImage(named: "password hidden eye icon.png"), for: .normal)
    }


}

