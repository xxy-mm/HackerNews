//
//  ContentView.swift
//  HackerNews
//
//  Created by 笑 on 2023/9/29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
        }.onAppear {
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
