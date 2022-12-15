//
//  FetchCustomView.swift
//  he
//
//  Created by Hesamoddin on 8/20/22.
//

import SwiftUI

struct FetchCustomView: View {
    @ObservedObject var fetchdata : FetchedProduct
    var body: some View {
        
        LazyVStack(alignment:.leading,spacing:12) {

        ForEach(fetchdata.fetchedProducts,id:\.self) { item in
            
            Text("\(item.name)")
            
        }
        }.onAppear(perform: {
            fetchdata.DecodeProducts()
        })
    }
}

struct FetchCustomView_Previews: PreviewProvider {
    static var previews: some View {
        FetchCustomView(fetchdata: FetchedProduct())
    }
}
