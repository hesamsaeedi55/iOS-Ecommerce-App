//
//  GithubAPI.swift
//  InfiniteListSwiftUI
//
//  Created by Vadim Bulavin on 6/11/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Foundation
import Combine

enum GithubAPI {
    static let pageSize = 1
    
    static func searchRepos(page: Int) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "http://localhost:8000/api/show/10?page=\(page)")!
        print(page)
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!) })
            .tryMap { try JSONDecoder().decode(GithubSearchResult<Repository>.self, from: $0.data).data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct GithubSearchResult<T: Codable>: Codable {
    let data: [T]
}

struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
}
