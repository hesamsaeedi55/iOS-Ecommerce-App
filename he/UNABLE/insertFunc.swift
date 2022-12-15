//
//  Insert.swift
//  alamofireUI
//
//  Created by Hesamoddin on 4/18/20.
//  Copyright © 2020 Hesamoddin. All rights reserved.
//

import SwiftUI
import Alamofire



struct Insert: View {
    
    struct album : Codable {
        let name : String
        let datereleased : String
    }
    
   @State var albumer = [album]()
    
    @State var albuma = [album]()
    
    @State var band = ""
    
    @State var name = ""
    @State var ex = ""
    @State var img = ""
    @State var check = ""
    
    
    
//    func alamo() {

//
//            AF.request("http://hesamsaeedi.ir/clicksiteproject/albumers.php").responseJSON { (response) in
//
//                      let result = response.data
//
//
//                      do {
//
//
//
//
//                        self.albuma = try JSONDecoder().decode([album].self, from: result!)
//
//                        for eachalbum in self.albuma {
//
//
//                            print(eachalbum.name)
//                              //print("\(eachmahsul.name) : \(eachmahsul.ex) : \(eachmahsul.img_name)")
//
//
//
//                              DispatchQueue.main.async {
//                          }
//
//
//                      }
//
//
//                      }catch{
//                          print("error")
//                      }
//
//
//                  }
//    }
//
    
    var body: some View {
        
        
        VStack {
            TextField("name" , text: $name )
            TextField("ex" ,   text: $ex)
            TextField("img" , text: $img)
            Spacer()
            TextField("checker" , text: $check).frame(width: 100, height: 50, alignment: .center)
                .autocapitalization(.none)

            Spacer()
            
            
            // dasture get dakhele dasture post
            
            
            
            Button("send") {
                AF.request("http://hesamsaeedi.ir/clicksiteproject/insertor.php", method: .post, parameters:["name":self.name,"datereleased":ex.self,"downloadtimes":"22","band":"889"]).response { (response) in
                               
                               }
          }
            
            
            Button("sendAnother") {
                AF.request("http://localhost:8000/api/productstore",method: .post, parameters: [
                
                    "name" : "3refe",
                    "slug" : "Efsfaefa",
                    "price" : 12
                
                ])
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .response
                
                { response in
                    
                    print(response.error)
                }
                
            }
            
            
            
            Button("check") {
                AF.request("http://hesamsaeedi.ir/clicksiteproject/albumers.php", method: .post,
                           parameters:[ "thistable":self.check ]).response { (response) in
                            
                            AF.request("http://hesamsaeedi.ir/clicksiteproject/albumers.php").responseJSON { (responser) in
                                                
                                                let result = response.data

                                                
                                                do {
                                                  
                                                  
                                                  
                                                    
                                                  self.albumer = try JSONDecoder().decode([album].self, from: result!)

                                                  for eachmahsul in self.albumer {
                                                      
                                                        
                                                    print(eachmahsul.name , eachmahsul.datereleased)
                                                        //print("\(eachmahsul.name) : \(eachmahsul.ex) : \(eachmahsul.img_name)")
                                                        

                                                      
                                                        DispatchQueue.main.async {
                                                    }
                                                     
                                                    
                                                }
                                                    
                                                    
                                                }catch{
                                                    print("error")
                                                }
                                                
                                                
                                            }
                                              
                                              }
            }
                
            }
//        .onAppear(perform: {self.alamo()})
            
        }
    }


struct Insert_Previews: PreviewProvider {
    static var previews: some View {
        Insert()
    }
}
