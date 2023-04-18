
//
//  Item.swift
//  shapes
//
//  Created by Hesamoddin on 12/16/21.
//

import SwiftUI

struct item : Identifiable {
    var id = UUID().uuidString
    var title : String
    var subtitle : String
    var price : String
    var rating : String
    var image : [String]
    var altImage : String
}

// NOTE BOTH IMAGE AND COLORS NAME ARE SAME

var items = [
    
    item(title: "Donda", subtitle: "Ye", price: "90", rating: "4", image: ["cd","2","1"]),
    item(title: "OK COMPUTER", subtitle: "Radiohead", price: "150", rating: "5", image:["cd","2","4"]),
    item(title: "KID A", subtitle: "Radiohead", price: "150", rating: "3.9", image: ["cd","2","3"]),
    item(title: "Stoney", subtitle: "Post Malone", price: "160", rating: "4.2", image: ["cd","2","3"]),
    item(title: "Leonardo", subtitle: "Book Of Leonardo", price: "1,160", rating: "4.8", image: ["1","2","3"])


]



struct customer : Identifiable {
    let id = UUID().uuidString
    let name : String
    var wishList : [item] = []
  
}


extension customer {
    static let ex = customer(name: "hesam", wishList: [])
}
