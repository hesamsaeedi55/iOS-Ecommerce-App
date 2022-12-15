//
//  Sample.swift
//  he
//
//  Created by Hesamoddin on 5/1/22.
//

import SwiftUI

struct Sample: View {
    @State var index = 0
    var images = [["1", "2", "3", "1"],["4","5","6"],["4","5","6"]]
    var images2 = ["4","5","6"]

    private let categories = ["t-shirt","pants","shoes","backpack","accessories","jackets","hoodies"]
    private let contents = ["tttt","ppppp","sssss","bbbbbb","aaaaa","jjjjjj","hhhhhh"]
    @State var selected : Int = 0
    var body: some View {
        
        ZStack {
            Color(.darkGray)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing : 20) {
                ScrollView( .horizontal , showsIndicators: false) {
                    
                    VStack {
                HStack {
                    
                    ForEach(0 ..< categories.count) { item in
                        contentList(isActive: item == selected, text: categories[item])
                            .onTapGesture {
                                selected = item
                            }
                    }
                    .padding(.horizontal,2)
                    
                }
                }
                }
                
                
                GeometryReader { geo in
                PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                    ForEach(self.images[selected], id: \.self) { imageName in
                        
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:geo.size.width - 50,height:geo.size.height/2.1)

                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 35))
               
                    
                }
                .frame(width:geo.size.width,height:geo.size.height/2)
                .background(Color(.yellow))
                    

                    
                }
                
                
                GeometryReader { geo in
                PagingView(index: $index.animation(), maxIndex: images.count - 1) {
                    ForEach(self.images[selected], id: \.self) { imageName in
                        
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:geo.size.width - 50,height:geo.size.height/2.1)

                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 35))
               
                    
                }
                .frame(width:geo.size.width,height:geo.size.height/2)
                .background(Color(.yellow))
                    

                    
                }
                ScrollView {
                ForEach(0..<categories.count) { i in
                    Image("\(1)")
                        .resizable()
                }
                
                }.background(Color(.blue))
            
        }
        }
        
    }
}


struct PageControl2: View {
    @State var index: Int
    let maxIndex: Int
    var body: some View {
        GeometryReader { geo in
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index && index == maxIndex ? Color.red :
                        index == self.index ? Color.white : Color.gray)
                    
                   
                    .frame(width: 8, height: 8)
                }
            }
        }
        .padding(15)
    }
}

struct contentList: View {
    let isActive : Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0)
                        {
        Text(text)
            .font(.system(size: 18))
            if (isActive) {
        Color(.black)
            .frame(width:33,height: 2)
            .clipShape(Capsule())
            }
        }
    }
}


struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}

