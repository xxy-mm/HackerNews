//
//  DetailView.swift
//  HackerNews
//
//  Created by 笑 on 2023/9/29.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    @State var isLoading = true
    var body: some View {
        ZStack {
            WebView(urlString: url, isLoading: $isLoading)
            if isLoading {
                if #available(iOS 14.0, *) {
                    ProgressView()
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
