//
//  ViewController.swift
//  GItAPITableView
//
//  Created by koala panda on 2023/04/14.
//

import UIKit

class ViewController: UIViewController {
    private let cellClassName = "TableViewCell"
    private let reuseId = "TableViewCell"
    private let api = GitHubAPI()
    var items: [GitHubModel] = []

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)
            tableView.delegate = self
            tableView.dataSource = self


        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getData { items, error in
            DispatchQueue.main.async {
                if let _error = error {
                    debugPrint(_error)
                    return
                }
                guard let _items = items else {
                    return
                }
                self.items = _items
                self.tableView.reloadData()
            }


        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellClassName) as?
                TableViewCell else {
                    fatalError()
                }
        let githubModel = items[indexPath.item]
        cell.configure(gitHubModel: githubModel)
        return cell
    }


}
