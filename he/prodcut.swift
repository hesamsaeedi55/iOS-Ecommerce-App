//
//  Created by Hesamoddin on 10/22/21.
//

import Foundation

struct product : Hashable, Identifiable{
    let id = UUID().uuidString
    var category : cat
    var name : String
    var picture : String
    var description : String
    var isavailable : Bool
}

enum cat {
    case dress
    case book
    case cd
    case clothes
}


var examples : [product] = [
product(category: .clothes, name: "shirt", picture: "", description: "", isavailable: true),
    product(category: .clothes, name: "shaaaairt", picture: "", description: "a cool shirt made by Hesam and designed by Delara", isavailable: true),
    product(category: .clothes, name: "shirt", picture: "", description: "a cool shirt made by Hesam and designed by Delara", isavailable: true),
    product(category: .clothes, name: "shirt", picture: "", description: "a cool shirt made by Hesam and designed by Delara", isavailable: true),
    product( category: .clothes, name: "shirt", picture: "", description: "a cool shirt made by Hesam and designed by Delara", isavailable: true)
    
]
