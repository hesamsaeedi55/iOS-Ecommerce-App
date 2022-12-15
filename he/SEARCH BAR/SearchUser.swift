//
//  SearchUser.swift
//  he
//
//  Created by Hesamoddin on 7/21/22.
//

import SwiftUI



class SearchProduct: ObservableObject {
    
    @Published var searchedProduct : [Product] =  []
    
    @Published var query = ""
    
    @Published var page = 1
    
    func find() {
        
        //removing spaces
        
        
        print(query)
        print(page)
        
        
        
        
        let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let betterUrl = searchQuery.replacingOccurrences(of: " ", with: "%20")

           
           let url =  "http://localhost:8000/api/search/\(betterUrl)/2?page=\(page)"
    
        
        print(url)
      

        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _,error) in
            
            guard let jsonData = data else {return}
            
            do {
                
                let products = try JSONDecoder().decode(Results.self, from: jsonData)
                
                //appending to searchData
                
                DispatchQueue.main.async {
                    
                    //removing data if it's new request
                    
                    if self.page == 1 {
                        self.searchedProduct.removeAll()
                    }
                    
                    
                    
                    
                    //checking if any already loaded is again loaded
                    self.searchedProduct = Array(Set(self.searchedProduct).union(Set(products.data)))
                        .sorted(by: { cell1, cell2 in
                            return cell1.id < cell2.id
                        })
                     

                    
//                    self.searchedUser.append(contentsOf: products.data)
                }
                
                
                
            }catch {
                print(error)
            }
            
        }.resume()
        
        
    }
}

struct Product : Decodable,Hashable,Identifiable {
    
    let id: Int
    let name: String
    let image : String
//    let slug: String
    let description: String
    let price: String
    let entity: Int
}

struct Results : Decodable {
    var data : [Product]
}



struct SearchUser: View {
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct SearchUser_Previews: PreviewProvider {
    static var previews: some View {
        SearchUser()
    }
}
