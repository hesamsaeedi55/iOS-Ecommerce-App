//
//  GithubAPI.swift
//  InfiniteListSwiftUI
//
//  Created by Vadim Bulavin on 6/11/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Foundation
import Combine

class GithubAPI3 {
    
    static let pageSize = 1
    
    static func searchRepos(page: Int, cat: Int) -> AnyPublisher<[Repository3], Error> {
        
        let url = URL(string: "http://localhost:8000/api/wishlistshow/\(cat)/10?page=\(page)")!

//        let url = URL(string: "http://localhost:8000/api/showpro/\(cat)/2?page=\(page)")!
        print(page)
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!) })
            .tryMap { try JSONDecoder().decode(GithubSearchResult<Repository3>.self, from: $0.data).data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct GithubSearchResult3<T: Codable>: Codable {
    let data: [T]
}

struct Repository3: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let image : String
//    let slug: String
//    let description: String
    let price: String
//    let entity: Int
}
