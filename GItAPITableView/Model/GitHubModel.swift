//
//  GitHubModel.swift
//  GItAPITableView
//
//  Created by koala panda on 2023/04/14.
//

import Foundation
struct Owner: Codable {
    var id: Int
    var login: String
}

struct GitHubModel: Codable {
    var id: Int
    var name: String
    var fullname: String
    var owner: Owner

    // jsonのkeyとパラメータの対応付け
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullname = "full_name"
        case owner
    }
}

struct GitHubResponse: Codable {
    var items: [GitHubModel]
}
