//
//  CardView.swift
//  shapes
//
//  Created by Hesamoddin on 12/16/21.
//

import SwiftUI




struct CardView: View {
    
    
    
    
    var customerWish : customer?
    var item : item
    var animation : Namespace.ID
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer(minLength: 0)
                Text(item.price)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .padding(.vertical,10)
                    .padding(.horizontal,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            
            
            
            Image("\(item.image.first!)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top,40)
                .padding(.bottom)
                .padding(.horizontal,10)
                .matchedGeometryEffect(id: "image\(item.id)", in: animation)

            
            
            Text(item.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            
            Text(item.subtitle)
                .foregroundColor(.gray)
                .font(.caption)
            
            
            // using matched for hero animation
            HStack {
                
                Button(action : {
        
                    
                    
                }) {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                }
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)

                Spacer(minLength: 0)
                
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)

                
                
            }
        }
        .padding(.horizontal)
        .padding(.bottom)

        //giving hero effect for  color
        .background(
            Color.gray.opacity(0.2)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation)
        )
        .cornerRadius(20)
    }
}
