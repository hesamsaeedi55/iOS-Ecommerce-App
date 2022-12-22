//
//  productSquare.swift
//  he
//
//  Created by Hesamoddin on 10/29/21.
//  Copyright © 2020 Hesamoddin. All rights reserved.


import SwiftUI

@available(iOS 15.0, *)
struct ProductsSquare: View {
    var product : Repository
    var blur: Bool
    var name : String
    var imageLink : String
    var body: some View {
let url = URL(string: "\(imageLink)")!
        GeometryReader { geo in
            VStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: url) {
                    
                    
                    phase in switch phase {
                        case .failure: Image(systemName: "photo") .font(.largeTitle)
                        case .success(let image): image .resizable()
                        default: ProgressView() }
                
            }
//                    .frame(width: geo.size.width - 5 ,height:200)
//                    .if(blur) {
//                        $0.blur(radius:25)
//                    }
                }.cornerRadius(5)
                HStack {
                    Text("\(product.name)")
                    .foregroundColor(.black)
                    .font(.system(size: 22, weight:.semibold))
//                    .if(blur) {
//                        $0.redacted(reason: .placeholder)
//                    }
                }
                Text("$ \(product.price)")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }
        }  .frame(height:240)
        
        
        
    }
}

//struct ProductsSquare_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonSquare(person: Person.example,blur: false)
//            .frame(width : 155)
//    }
//}
