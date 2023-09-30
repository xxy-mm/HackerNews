//
//  NetworkManager.swift
//  HackerNews
//
//  Created by 笑 on 2023/9/29.
//

import Foundation


class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    return print(error!.localizedDescription)
                }
                if let safeData = data {
                    do {
                        let results = try JSONDecoder().decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    }catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}


