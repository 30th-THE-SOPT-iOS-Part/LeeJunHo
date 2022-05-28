//
//  MockViewController.swift
//  Seminar7
//
//  Created by Junho Lee on 2022/05/28.
//

import UIKit

class MockViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = [] {
        didSet {
            print("new value update")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        guard let data = MockParser.load(LoginMockModel.self, from: "LoginMock") else { return }
        print(data)
    }


}

extension MockViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        return cell
    }
}
