//
//  Home.swift
//  he
//
//  Created by Hesamoddin on 7/21/22.
//

import SwiftUI




@available(iOS 15.0, *)
struct Home1: View {
    @State var show = false
    @StateObject var searchData = SearchProduct()

    @State private var hidebutton = true
    
    var body: some View {
        ZStack {
        VStack {
            
        ContentView1(searchData: searchData)

        Spacer()
            
        }
        }
        
        

        
        .onChange(of: searchData.query) { (newData) in
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            if newData == searchData.query {
                
                if searchData.query != "" {
                    
                    if newData.contains("\(searchData.query)") {
                        searchData.page = 1
                        searchData.searchedProduct.removeAll()
                        searchData.find()
                    }
                    
                    searchData.find()
                                        
                }else {
                    
                    searchData.page = 1
                    searchData.searchedProduct.removeAll()
                    
                }
                
                
            }
            
            
        }
      }
       
    }

}

@available(iOS 15.0, *)
struct Home1_Previews: PreviewProvider {
    static var previews: some View {
        Home1( searchData: SearchProduct())
    }
}

extension UIApplication {
    func endEditing1() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
