//
//  ContentView.swift
//  HackerNews
//
//  Created by Robert Franczak on 08/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("HACKER NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
////    Post(id: "1", title: "Hello"),
////    Post(id: "2", title: "Bye"),
////    Post(id: "3", title: ":D")
//    Post(objectID: "123", points: 1, title: "One", url: "https://")
//]
