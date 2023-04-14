//
//  TableViewCell.swift
//  GItAPITableView
//
//  Created by koala panda on 2023/04/14.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var id: UILabel!
    @IBOutlet private weak var fullname: UILabel!
    @IBOutlet private weak var login: UILabel!


    override func prepareForReuse() {
        id.text = nil
        fullname.text = nil
        login.text = nil
    }

    func configure(gitHubModel: GitHubModel) {
        self.id.text = "id: \(String(gitHubModel.id))"
        self.fullname.text = "fullname: \(gitHubModel.fullname)"
        self.login.text = "login: \(gitHubModel.owner.login)"
    }

}
