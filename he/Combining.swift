////
////  Combining.swift
////  he
////
////  Created by Hesamoddin on 7/10/22.
////
//
////
////  Combining.swift
////  TINDER
////
////  Created by Hesamoddin on 12/3/21.
////
//
//import SwiftUI
//
//struct Combining: View {
//    
//    @State var change : Bool = false
//    
//    var width = UIScreen.main.bounds.width
//    var height = UIScreen.main.bounds.height
//
//    var body: some View {
//        ScrollView(.vertical,content :{
//                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],
//                  alignment: .center,
//                  spacing:50,
//                  content: {
//                  ForEach(Products.example) { item in
////                    ProductsSquare(product: item, blur: !(item.isAvailable), name: item.name, imageLink: item.link)
//                        .onTapGesture {
//                        }
//                    .frame(height:240)
//                       }
//                  }).padding(.horizontal,16)}).background(Color.black.ignoresSafeArea())
//           
//           
//        
//    }
//}
//
//struct Combining_Previews: PreviewProvider {
//    static var previews: some View {
//        Combining()
//    }
//}
//
//
//struct Products : Identifiable {
//    let id = UUID().uuidString
//    var code : Int
//    var name : String
//    var isAvailable : Bool
//    var link : String
//}
//
//
//extension Products {
//   static var example : [Products] = [
//        Products(code: 1, name: "brown hoodie", isAvailable: false, link: "1"),
//        Products(code: 2, name: "leather pants", isAvailable: true, link: "2"),
//        Products(code: 3, name: "green puffer", isAvailable: true, link: "3"),
//        Products(code: 4, name: "black shirt", isAvailable: true, link: "5"),
//    Products(code: 1, name: "brown hoodie", isAvailable: true, link: "1"),
//    Products(code: 2, name: "leather pants", isAvailable: true, link: "2"),
//    Products(code: 3, name: "green puffer", isAvailable: false, link: "3"),
//    Products(code: 4, name: "black shirt", isAvailable: true, link: "5")
//
//    ]
//}
