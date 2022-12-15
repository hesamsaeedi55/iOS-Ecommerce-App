//
//  showProduct.swift
//  he
//
//  Created by Hesamoddin on 5/9/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct showProduct: View {
    @State var showModal = false
    var images = ["1","2","3","4"]
    var sizes = ["S","M","L","XL"]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            VStack {
        TabView {
            ForEach(1...5,id: \.self) { index in
                
                Image("\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:getRect().width,height:getRect().height-400)
                    .cornerRadius(1)
                    .onTapGesture {
                        showModal.toggle()
                    }
            }.sheet(isPresented: $showModal, content: {
                category()
            })
            
        }
        .offset(x: 0, y: 0)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
                Text ("hello")


            }
        }
    }
}

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}


@available(iOS 15.0, *)
struct showProduct_Previews: PreviewProvider {
    static var previews: some View {
        showProduct()
    }
}
