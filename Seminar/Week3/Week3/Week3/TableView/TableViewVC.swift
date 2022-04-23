//
//  TableViewVC.swift
//  Week3
//
//  Created by Junho Lee on 2022/04/23.
//

import UIKit

class TableViewVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCell()
        setDelegate()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: MyTableViewCell.identifier, bundle: nil)
                myTableView.register(nib, forCellReuseIdentifier: MyTableViewCell.identifier)
    }
    
    private func setDelegate() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension TableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        
        cell.setData(MusicDataModel.sampleData[indexPath.row])
        
        return cell
    }
}
