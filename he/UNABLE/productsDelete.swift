//
//  productsDelete.swift
//  he
//
//  Created by Hesamoddin on 12/23/21.
//

import SwiftUI
import Alamofire




struct productsDelete: View {
    
    struct produ : Decodable,Hashable,Identifiable {
        let id : Int
        let name : String
        let description : String
    }

    @State  var produc = [produ]()

    var body: some View {
            VStack {
            ForEach(produc) { item in
                
                Text("\(item.description)")
                    .onTapGesture {
                        deleteProduct(item.id)
                    }
                
            }
            }
        .onAppear(perform: {
            alamo()
        })
    }
    
    
    
    
    func deleteProduct(_ id : Int) {
        
        AF.request("http://localhost:8000/api/des/\(id)",method: .delete).responseJSON { (response) in
            
            do {
                
                DispatchQueue.main.async {
                    print("done")
                    alamo()
                }
                
            }
        }
    }
    
    
   
    
    func alamo() {
        
        AF.request("http://localhost:8000/api/show",method: .get).responseJSON { (response) in
                  
                  let result = response.data

                  
                  do {
                    
                    self.produc = try JSONDecoder().decode([produ].self, from: result!)
                    for eachmahsul in self.produc {
                        print(eachmahsul.description)
                          DispatchQueue.main.async {
                      }
                    }
                  }catch{
                      print("error")
                  }
        }
    }
    }


      
    
    struct productsDelete_Previews: PreviewProvider {
    static var previews: some View {
        productsDelete()
    }
}
