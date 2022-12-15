//
//  ZARA.swift
//  he
//
//  Created by Hesamoddin on 12/1/21.
//

import SwiftUI

struct ZARA: View {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @State private var currentTab = 0
    
    var body: some View {
        ScrollView {
    TabView {
        
        GeometryReader { geo in
            
            if geo.frame(in: .global).minX >= 0 {
            Image("5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                .padding(.trailing, 25)
                .padding(.leading, 25)
                .frame(width: geo.size.width, height: geo.size.height)
                
                
            } else {
                
                    Image("5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(x: geo.frame(in: .global).minX/12)
                    
                        .padding(.trailing, 25)
                        .padding(.leading, 25)
                        .frame(width: geo.size.width, height: geo.size.height)
                
                
            }
            
            Text("SAY HELLO TO GRAND CANYON")
                .frame(width: width, height: height, alignment: .center)
                .font(.custom("Stadium-Display", size: 126))
                .shadow(color:Color.pink,radius: 100)
            
        }.clipped()
       
        
        GeometryReader { geo in
            
            if geo.frame(in: .global).minX >= 0 {
            Image("8")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                .padding(.trailing, 25)
                .padding(.leading, 25)
                .frame(width: geo.size.width, height: geo.size.height)
                
                
            } else {
                
                    Image("8")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(x: geo.frame(in: .global).minX/12)
                    
                        .padding(.trailing, 25)
                        .padding(.leading, 25)
                        .frame(width: geo.size.width, height: geo.size.height)
                
                
            }
            
            Text("SAY HELLO TO GRAND CANYON")
                .frame(width: width, height: height, alignment: .center)
                .font(.custom("haas-Display", size:66))
                .shadow(color: Color.green,radius: 26)
            
        }.clipped()

    }
    
    .tabViewStyle(PageTabViewStyle())
     .frame(width: width, height: height, alignment: .center)
     .tabViewStyle(PageTabViewStyle())
        }.edgesIgnoringSafeArea(.all)
        }
    }


struct ZARA_Previews: PreviewProvider {
    static var previews: some View {
        ZARA()
    }
}
