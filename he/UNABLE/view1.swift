//
//  view1.swift
//  he
//
//  Created by Hesamoddin on 1/28/22.
//

import SwiftUI
import Alamofire

struct new : Decodable,Hashable {
    var current_page : Int
    var data : [data]
    
}


struct view1: View {

 
    @ObservedObject var datas = getData()
    
    var body: some View {
        
        List(0..<datas.Data.count,id: \.self) { i in
            
            
            if i == self.datas.Data.count - 1 {
                
                cellView(dataStr: datas.Data[i], isLast: true, listData: self.datas)
                
            }else{
                
                cellView(dataStr: datas.Data[i], isLast: false, listData: self.datas)

            }
        }
    }
    
    }

class getData : ObservableObject {
        
    @Published var Data = [data]()
    @Published var count = 1
    
    init() {
        
            update()
         }
    
    func update() {
                
        AF.request("http://localhost:8000/api/show/10?page=\(count)" , method: .get).responseJSON {(response) in
            
            let result = response.data
            
            do {
                
                let json = try JSONDecoder().decode(new.self,from:result!)
                
                let oldData = self.Data
                
                DispatchQueue.main.async {
                    
                    self.Data = oldData + json.data
                    
                    
                    if json.data == [] {
                        
                        
                        print("NIL")
                        
                        
                    }else{
                    
                    self.count += 1
                        
                    }
                    
                    print(self.count)
                    
                }
                
                print(json.data)
                print(json.current_page)
                
            }catch{
                print(error)
            }
          
        }
    }
}



struct data : Decodable,Hashable {
            
    var id : Int!
    var name : String!
    var description : String!
    
}

struct cellView : View {
    
    var dataStr : data
    var isLast : Bool
    
    @ObservedObject var listData : getData
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text("\(dataStr.id)")
            Text(dataStr.name)
            if self.isLast {
            Text(dataStr.description)
                
                .onAppear {
                    
                    print("LOAD DATA")

                    self.listData.update()
                }
            }else{
                Text(dataStr.description)
            }
            
        }.padding(.top,10)
    }
    }
  
    

struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}
