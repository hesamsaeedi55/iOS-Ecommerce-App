//
//  FetchView.swift
//  he
//
//  Created by Hesamoddin on 8/19/22.
//

import SwiftUI




struct FetchView: View {
    
    @StateObject var fetch = FetchedProduct()
    
    var body: some View {
        
        VStack {
        
            FetchCustomView(fetchdata: FetchedProduct())

        }
        
    }
}

struct FetchView_Previews: PreviewProvider {
    static var previews: some View {
        FetchView()
    }
}
