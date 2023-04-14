//
//  GitHubAPI.swift
//  GItAPITableView
//
//  Created by koala panda on 2023/04/14.
//

import Foundation

enum GitHubError: Error {
    case error(Error)
}



final class GitHubAPI {
    func getData(completion: (([GitHubModel]?, Error?) -> Void)? = nil) {
        if let url = URL(string: "https://api.github.com/search/repositories?q=swift") {
            let urlRequest = URLRequest(url: url)

            let session = URLSession.shared
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                    guard let data = data,
                          let decoded = try? jsonDecoder.decode(GitHubResponse.self, from: data) else {
                        completion?(nil, error)
                        return
                    }
                    completion?(decoded.items, nil)
            }
            task.resume()
        }

    }
}


