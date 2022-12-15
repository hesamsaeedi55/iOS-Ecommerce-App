//
//  FirstView.swift
//  he
//
//  Created by Hesamoddin on 7/17/22.
//

import SwiftUI

var tabs = ["glasses","watches","shoes","perfums","statues","socks"]

struct eynak: View {
    @State var selected = tabs[0]
    @Namespace var animation
    @State var showind = false
    @State var show = false
    @State var selectedItem : item = items[0]
    @StateObject var fetch = FetchedProduct()

    var body: some View {
        ZStack {
            VStack{
                
                HStack {
                    
                    Button(action: {
                        

                    })
                    {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 25,weight:.heavy))
                            .foregroundColor(.black)
                        
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Image("3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:45,height:45)
                            .cornerRadius(12)
                    }
                    
                }
                .padding(.top,30)
                
                
                .padding(.vertical,10)
                .padding(.horizontal)
                
                
                ScrollView {
                    
                    VStack(spacing:0) {
                        
                        HStack {
                        VStack(alignment:.leading) {
                            Text("Let's")
                                .font(.title)
                                .foregroundColor(.black)
                            Text("Get Started")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                            Spacer()
                        }
                        
                        ScrollView(.horizontal,showsIndicators:showind) {
                        HStack(spacing: 0) {
                            ForEach(tabs, id:\.self) { item in
                                    
                                TabButton(title:item , animation: animation, selected: $selected)
                                
                                    .padding()
                                    
                                   
                                

                                
                                if tabs.last != item {Spacer(minLength: 0)}
                                }
                            }
                        }
                        
                        
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2),spacing:25) {
                            
                            ForEach(items) { item in
                                
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            
                                            selectedItem = item
                                            show.toggle()
                                            
                                        }
                                    }

                            }
                        }.padding()
                        
                    }
                    
                }
                Spacer(minLength: 0)
                
            }
            
            .opacity(show ? 0 : 1)
            if show {
                
                Detail(selectedItem: $selectedItem, show: $show, animation: animation)
                
            }

        }
        .ignoresSafeArea()
    }
}

struct eynak_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            eynak()


        }
    }
}

