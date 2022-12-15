//
//  CustomSearchView.swift
//  he
//
//  Created by Hesamoddin on 8/19/22.
//

import Foundation

class FetchedProduct : ObservableObject {
    
    @Published var fetchedProducts : [Producers] = []
    @Published var query = ""
    @Published var page = 1
    
    func DecodeProducts() {
        
        let url = "http://localhost:8000/api/producers/1/13?page=1"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data,_,error) in
            
            guard let jsonData = data else {return}
            
            do {
                
                let products = try JSONDecoder().decode(ResultsProduct.self, from: jsonData)
                
                DispatchQueue.main.async {
                    
                    self.fetchedProducts = Array(Set(self.fetchedProducts).union(Set(products.data)))
                    print(products.data)
                }
            }catch{
                print(error)
                }
                
        }.resume()
            
            
        }
        
    }

struct Producers : Decodable,Hashable {
    var id : Int
    var name : String
}

struct ResultsProduct : Decodable {
    var data : [Producers]
}


