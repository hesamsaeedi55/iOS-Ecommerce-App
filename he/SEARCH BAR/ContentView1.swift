//
//  ContentView1.swift
//  he
//
//  Created by Hesamoddin on 7/21/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView1: View {
    @ObservedObject var  searchData : SearchProduct
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
            VStack {
                CustomSearchBar(searchData: searchData)
//                .preferredColorScheme(.dark)
//                .navigationTitle("Black hole Search")
                Spacer()
            }
            
            .background(Color.black)
            }            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

@available(iOS 15.0, *)
struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1(searchData: SearchProduct())
    }
}
