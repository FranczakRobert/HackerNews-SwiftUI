//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Robert Franczak on 08/04/2023.
//

import Foundation

class NetworkManager : ObservableObject {
    
//    @Published var posts : [Post]?
    @Published var posts = [Post]()
    
    
    let urlString = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fetchData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task  = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let resultData = try decoder.decode(Results.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = resultData.hits
                            }
                        }
                        catch {
                            print("Not able to decode")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
