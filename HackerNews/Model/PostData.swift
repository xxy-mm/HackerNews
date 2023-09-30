//
//  PostData.swift
//  HackerNews
//
//  Created by 笑 on 2023/9/29.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    var id: String {
        objectID
    }
    
    let objectID: String
    let title: String
    let url: String
    let points: Int
}

