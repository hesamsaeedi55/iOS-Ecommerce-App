//
//  ContentView.swift
//  alamofireUI
//
//  Created by Hesamoddin on 4/17/20.
//  Copyright © 2020 Hesamoddin. All rights reserved.
//

import SwiftUI
import Alamofire
import AlamofireImage
import URLImage



// image download
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}






struct ContentView: View {
    
    @State  var mahsulat = [mahsul]()

    
    struct mahsul : Codable,Identifiable {
        
           let id:String
           let name: String
           let ex: String
           let img_name : String
        
    }
    
    
    var body: some View {
        NavigationView {
            Text("hey")
      
  
        .onAppear(perform: {self.alamo()})
                .onAppear(perform: {
                    seeData()
                })
    
        .navigationTitle("Hello")
        
               
        .navigationBarItems(leading:  NavigationLink(destination: Insert()) {
                           Text("Delivery details")
                       })
       
            
        }.onAppear(perform: { self.imgdl()})
//        .onAppear(perform: {
//            alamo()
//        })
        }
    

    func alamo() {

            AF.request("http://hesamsaeedi.ir/clicksiteproject/index.php").responseJSON { (response) in
                      
                      let result = response.data

                      
                      do {
                        
                        
                        
                          
                        self.mahsulat = try JSONDecoder().decode([mahsul].self, from: result!)

                        for eachmahsul in self.mahsulat {
                            
                              
                            print(eachmahsul.name)
                              //print("\(eachmahsul.name) : \(eachmahsul.ex) : \(eachmahsul.img_name)")
                              

                            
                              DispatchQueue.main.async {
                                
                          }
                           
                          
                      }
                          
                          
                      }catch{
                          print("error")
                      }
                      
                      
                  }
       

    }
            
          
    func imgdl() {
       
      
        AF.request("http://hesamsaeedi.ir/clicksiteproject/img/momento_sofa.png",method: .get).responseImage {response in
        }
    }
    
    func seeData() {
        AF.request("http://localhost:8000/api/products").responseJSON { response in
            
            let rt = response.data
            
            do {
                
            }
            
            
        }
    }
        
    
    
}

    
  

    

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
