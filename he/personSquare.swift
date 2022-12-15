//
//  personSquare.swift
//  he
//
//  Created by Hesamoddin on 7/10/22.
//


//
//  PersonSquare.swift
//  TINDER
//
//  Created by Hesamoddin on 9/21/21.
//

import SwiftUI

struct PersonSquare: View {
    var person : Person
    var blur: Bool
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width ,height:240)
//                    .if(blur) {
//                        $0.blur(radius:25)
//                    }
                Text("\(person.name), \(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight:.semibold))
//                    .if(blur) {
//                        $0.redacted(reason: .placeholder)
//                    }
            }.cornerRadius(16)
            .shadow(color:Color.pink,radius: 15 )
        }
        
        
        
    }
}

struct PersonSquare_Previews: PreviewProvider {
    static var previews: some View {
        PersonSquare(person: Person.example,blur: false)
            .frame(width : 155)
    }
}

struct Person: Hashable,Identifiable {
    let id = UUID().uuidString
    var name : String
    var imgURLs : [URL]
    var age : Int
}





extension Person {
    
    static let example =   Person(name: "Hesam", imgURLs:[ URL(string: "https://picsum.photos/400/344" )!,URL(string: "https://picsum.photos/400/355" )!,URL(string: "https://picsum.photos/400/300" )!,URL(string: "https://picsum.photos/400/321" )!,URL(string: "https://picsum.photos/400/242" )!,URL(string: "https://picsum.photos/400/365" )!], age: 21)
    
    static let example2 =  Person(name: "Leo", imgURLs:[ URL(string: "https://picsum.photos/400/301" )!], age: 34)
    static var examples : [Person] = [
        
      Person(name: "Hesam", imgURLs:[ URL(string: "https://picsum.photos/400/344" )!,URL(string: "https://picsum.photos/400/355" )!,URL(string: "https://picsum.photos/400/300" )!,URL(string: "https://picsum.photos/400/321" )!,URL(string: "https://picsum.photos/400/242" )!,URL(string: "https://picsum.photos/400/365" )!], age: 21),
                                            
      Person(name: "Leo", imgURLs:[ URL(string: "https://picsum.photos/400/301" )!], age: 34),
      
      
      Person(name: "Hesam", imgURLs:[ URL(string: "https://picsum.photos/400/310" )!], age: 21),
      Person(name: "Leo", imgURLs:[ URL(string: "https://picsum.photos/400/311" )!], age: 34),
      Person(name: "Hesam", imgURLs:[ URL(string: "https://picsum.photos/400/320" )!], age: 21),
      Person(name: "Leo", imgURLs:[ URL(string: "https://picsum.photos/400/301" )!], age: 34),
      Person(name: "Hesam", imgURLs:[ URL(string: "https://picsum.photos/420/300" )!], age: 21),
      Person(name: "Leo", imgURLs:[ URL(string: "https://picsum.photos/410/301" )!], age: 34),
      Person(name: "Hesam", imgURLs:[ URL(string: "https://picsum.photos/200/330" )!], age: 21),
      Person(name: "Leo", imgURLs:[ URL(string: "https://picsum.photos/300/301" )!], age: 34)
]
    
}

