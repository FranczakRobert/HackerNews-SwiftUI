//
//  PostData.swift
//  HackerNews
//
//  Created by Robert Franczak on 08/04/2023.
//

import Foundation

struct Results : Decodable {
    let hits : [Post]
    
    
}

struct Post : Decodable,Identifiable {
    
    let objectID : String
    let points   : Int
    let title    : String
    let url      : String?
    
    var id: String {
        return objectID
    }
}
