//
//  MenuList.swift
//  he
//
//  Created by Hesamoddin on 10/22/21.
//

import SwiftUI

struct MenuList : View {
    @State var isTapped : Bool = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BG1"), Color("BG2")]), startPoint: .top, endPoint: .bottom)
            GeometryReader { proxy in
                let size = proxy.size

                Color.black
                    .opacity(1)
                
                Circle()
                    .fill(Color("Purple"))
                    .blur(radius: 120)
                    .padding(50)
                    .offset(x: -size.width / 1.8 , y: -size.height / 5)
                Circle()
                    .fill(Color("LightBlue"))
                    .blur(radius: 150)
                    .padding(50)
                    .offset(x: size.width / 1.8 , y: -size.height / 2)
                Circle()
                    .fill(Color("LightBlue"))
                    .blur(radius: 90)
                    .padding(50)
                    .offset(x: size.width / 1.8 , y: size.height / 2)
                Circle()
                    .fill(Color("Purple"))
                    .blur(radius: 110)
                    .padding(100)
                    .offset(x: size.width / 1.8 , y: size.height / 2)
                Circle()
                    .fill(Color("Purple"))
                    .blur(radius: 110)
                    .padding(100)
                    .offset(x: -size.width / 1.8 , y: size.height / 2)
                Circle()
                    .fill(Color.orange)
                    .blur(radius: 150)
                    .padding(100)
                    .offset(x: size.width / 1.8 , y: size.height / 10)
                
            }
            VStack {
            ZStack {
                Text("Rick Sanchez Says Hi to You")
                    .foregroundColor(.white)
                
            }.padding(.top,50)
            Spacer()
            ScrollView {
                if isTapped == false {
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], alignment: .center, spacing: nil, pinnedViews: [], content: {
                    ForEach(examples) { ex in
                        
                        glassMorphicCardTest(name:ex.name)
                            .onTapGesture {
                                
                                isTapped.toggle()

                                
                            }
                        
                    }
                }).padding(.trailing,10)
                .padding(.leading,10)
                }else{
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], alignment: .center, spacing: nil, pinnedViews: [], content: {
                        ForEach(examples) { ex in
                            
                            glassMorphicCardTest(name:ex.name)
                                .onTapGesture {
                                    
                                    isTapped.toggle()
                                    
                                }
                            
                        }
                    }).padding(.trailing,50)
                    .padding(.leading,10)
                }
            }
                
            }
            
        }.edgesIgnoringSafeArea(.all)
        
        
      
        
    }
    
//    func getAttributedString() -> NSAttributedString {
//        let attstr = NSAttributedString(string: "Start Now And Learn More About \n Local Weather Instantly")
//        attstr.col
//    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
