//
//  ProductView2.swift
//  he
//
//  Created by Hesamoddin Saeedi on 9/23/1401 AP.
//

import Foundation
import SwiftUI
import Alamofire


@available(iOS 15.0, *)
struct ProductView2: View {
    
    
//
//    enum savebutton {
//        case 1 : "13"
//        case 2 : "17"
//    }
    
    var product : Product
    var name : String
    var imageLink : String
    var userClass : String
    
    

    @State var namesave = "17"
    @State var show = false
    
    @State var imgtgl = false
    
    var width = UIScreen.main.bounds.width
    var height =  UIScreen.main.bounds.height
    
    @ObservedObject var user = album()
    
   var body: some View {
       NavigationView {
           
           ZStack {
           
           ScrollView(showsIndicators:false) {
               
               GeometryReader { geometry in
                   VStack(alignment:.center) {
                       
                       
                       slide( images: URL(string: product.image)!)
                           .cornerRadius(20)
                       
                           .blur(radius: -geometry.frame(in: .global).minY/20)
                       
                       
                       //       Image("1")
                       //
                       //        .blur(radius: -geometry.frame(in: .global).minY/20)
                       //
                       //        .frame(width: geometry.size.width, height: geometry.size.height)
                       //        .offset(y:geometry.frame(in: .global).minY/7)
                       //        .aspectRatio(contentMode: .fill)
                       //
                       //        .clipped()
                       //
                       //
                       
                       
                       //            }else{
                       //                Product()
                       //                    .aspectRatio(contentMode: .fill)
                       //
                       //                    .frame(width:geometry.size.width , height: geometry.size.height + geometry.frame(in: .global).minY)
                       //                    .clipped()
                       //
                       //                    //hatman bayad bad az clipped biyad
                       //                    .offset(y: -geometry.frame(in: .global).minY)
                       //
                       //
                       //            }
                   }
                   .navigationBarBackButtonHidden(true)
                   .navigationBarHidden(true)
                   
               }
               
               .frame(height: UIScreen.main.bounds.height/2)
               
               //    .frame(height: geometry.size.height/1.5)
               .padding(.bottom, 15)
               
               VStack(alignment: .leading) {
                   HStack {
                       //        Image("1")
                       //            .resizable()
                       //            .clipped()
                       //            .cornerRadius(10)
                       //            .frame(width: 60, height: 60)
                       
                       
                       VStack(spacing:width/80) {
                           
                           VStack(alignment: .leading) {
                               
                               HStack {
                                   
                                   Text("\(product.name)")
                                       .foregroundColor(.black)
                                       .cornerRadius(12)
                                       .font(.bold(.title)())
                                       .lineLimit(nil)
                                   
                                   
                                   
                                   
                                   
                                   //            Image("\(namesave)")
                                   //
                                   //                    .resizable()
                                   //                    .frame(width: width/14, height: height/25)
                                   //                    .padding(.leading,6)
                                   //
                                   //                    .ifs(imgtgl == true,transform:{ view in
                                   //                        namesave = "13"
                                   //                    })
                                   //                    .onTapGesture(perform: {
                                   //                        imgtgl.toggle()
                                   //                    })
                                   
                                   Spacer()
                                   
                                   
                                   Button(action:{
                                       
                                       imgtgl.toggle()
                                       findid2()
                                       addtowishlist2(UserDefaults.standard.value(forKey: "usrid") as! Int,product.id,product.name,product.image,product.price)
                                   }) {
                                       
                                       Image(self.imgtgl == true ? "17"  : "13")
                                           .resizable()
                                           .frame(width: width/14, height: height/25)
                                       
                                   }
                                   
                                   
                               }
                               
//                               HStack {
//
//                                   Text("Available Sizes : ")
//                                       .font(.title2)
//                                       .fontWeight(.bold)
//
//                                   Button("S") {}
//                                       .font(.system(size:18))
//                                       .padding(6)
//                                       .overlay(RoundedRectangle(cornerRadius: 6)
//                                       .stroke(Color.black))
//                                       .padding(3)
//
//                                   Button("M") {}
//                                       .font(.system(size:18))
//                                       .padding(6)
//                                       .overlay(RoundedRectangle(cornerRadius: 6)
//                                       .stroke(Color.black))
//                                       .padding(3)
//
//                                   Button("L") {}
//                                       .font(.system(size:18))
//                                       .padding(6)
//                                       .overlay(RoundedRectangle(cornerRadius: 6)
//                                       .stroke(Color.black))
//                                       .padding(3)
//
//
//                                   Button("XL") {}
//                                       .font(.system(size:18))
//                                       .padding(6)
//                                       .overlay(RoundedRectangle(cornerRadius: 6)
//                                       .stroke(Color.black))
//                                       .padding(3)
//
//
//
//                               }
////
//                               Text("By \("")")
//                                   .fontWeight(.bold)
//                                   .font(.title)
//
                               
                               
                               Spacer()
                               
                               Text("Description")
                                   .fontWeight(.medium)
                                   .font(.title)
                               
                               
                               
                               
                               //                HStack {
                               //                    Group {
                               //                    Button("XS") { }
                               //                            .padding(6)
                               //                            .foregroundColor(.black)
                               //
                               //                            .font(.system(size:width/30))
                               //                            .overlay(
                               //                            RoundedRectangle(cornerRadius: 6)
                               //                                .stroke(Color.black)
                               //                                    )
                               //                            .padding(.trailing,width/40)
                               //                            .padding(.leading,-20)
                               //
                               //
                               //                        Button("S") { }
                               //                                .padding(6)
                               //                                .foregroundColor(.black)
                               //
                               //                                .font(.system(size:width/30))
                               //                                .overlay(
                               //                                RoundedRectangle(cornerRadius: 6)
                               //                                    .stroke(Color.black)
                               //                                        )
                               //                                .padding(width/40)
                               //
                               //                        Button("L") { }
                               //                                .padding(6)
                               //                                .font(.system(size:width/30))
                               //                                .foregroundColor(.black)
                               //
                               //                                .overlay(
                               //                                RoundedRectangle(cornerRadius: 6)
                               //                                    .stroke(Color.black)
                               //                                        )
                               //                                .padding(width/40)
                               //
                               //                        Button("XL") { }
                               //                            .foregroundColor(.black)
                               //                                .padding(6)
                               //                                .font(.system(size:width/30))
                               //                                .overlay(
                               //                                RoundedRectangle(cornerRadius: 6)
                               //                                    .stroke(Color.black)
                               //                                        )
                               //                                .padding(width/40)
                               //
                               //
                               //
                               //                    }
                               //
                               
                               //            Text("سایز های موجود")
                               //                .background(Color.yellow)
                               //                .font(.custom("AvenirNext-Bold", size: 20))
                               //                .lineLimit(nil)
                               //                .padding(.trailing,-20)
                               //
                               //            }
                               
                           }
                           
                           //            HStack {
                           //                Spacer()
                           //                Text("قیمت : ۶۰۰ هزارتومان")
                           //                            .font(Font.custom("BLotus", size: 30))
                           //            }
                           
                           HStack {
                               Spacer()
                               //
                               //        Text("میرا دیزاین >")
                               //                    .font(Font.custom("BBaranOutline", size: 30))
                               //                Text("برند")
                               //                    .font(.custom("AvenirNext-Regular", size: 20))
                               //                    .foregroundColor(.gray)
                               
                           }
                           
                       }
                       
                   }
                   
                   let articleContent = "\(product.description)"
                   
                   
                   Text(articleContent)
                   
                       .font(.custom("AvenirNext-Regular", size: 20))
                       .lineLimit(nil)
                       .multilineTextAlignment(.leading)
                       .padding(.bottom,150)
               
                   
               }
               
               
               
               
               //        ScrollView(.horizontal,showsIndicators:false) {
               //            HStack(spacing: 10) {
               //
               //                    NavigationLink(destination:art()) {
               //                        Image("1")
               //                            .resizable()
               //                            .frame(width: 100, height: 100)
               //                            .cornerRadius(12)
               //                            .shadow(radius: 10 )
               //                    }
               //
               //
               //            Spacer()
               //
               //
               //
               //            Image("1")
               //                .resizable()
               //                .frame(width: 100, height: 100)
               //                .cornerRadius(12)
               //                .shadow(radius: 10 )
               //            Spacer()
               //
               //            Image("3")
               //                .resizable()
               //                .frame(width: 100, height: 100)
               //                .cornerRadius(12)
               //                .shadow(radius: 10 )
               //            Spacer()
               //
               //            Image("4")
               //                .resizable()
               //                .frame(width: 100, height: 100)
               //                .cornerRadius(12)
               //                .shadow(radius: 10 )
               //
               //            Spacer()
               //
               //            Image("5")
               //                .resizable()
               //                .frame(width: 100, height: 100)
               //                .cornerRadius(12)
               //                .shadow(radius: 10 )
               //
               //                .onTapGesture {
               //
               //                    areyok()
               //
               //                }
               //
               //
               //            }.frame(height: 150).padding()
               //        }.frame(height: 150)
               //
               
               
               
           }
           
               HStack {
                   Text("$\(product.price)")
                       .font(.title)
                       .foregroundColor(.black)
                       .padding(.leading,22)

                   Spacer()
                   
                   Button("Add to Cart") {
                       findid2()
                       remove2(product.id)
                       addtopurchased2(UserDefaults.standard.value(forKey: "usrid") as! Int,product.id,product.name,product.image,product.price)
                   }
                   
                       .font(.title3)
                       .padding(7)
                       .foregroundColor(Color.black)
                       .frame(height: UIScreen.main.bounds.height/18)
                       .background(Color.yellow)
                       .cornerRadius(10.0)
                       .padding(.trailing,12)

                   
               }
               .frame(height: UIScreen.main.bounds.height/12)
               .padding(.horizontal)
               .background(Color.gray)
               .cornerRadius(20.0)
               .frame(maxHeight: .infinity, alignment: .bottom)
               .edgesIgnoringSafeArea(.bottom)

               
       }
    }.environmentObject(user)
           .onAppear(perform: {
               
               searchuserid(productid: 1)
               
               
           })
       
    
   }
}

func addtopurchased2(_ userid: Int, _ productid: Int, _ name: String, _ image: String,_ price : String) {
    
    print(MyModel().anytext)

    
    AF.request("http://localhost:8000/api/purchase",method: .post,parameters: [
        
                "userID" : userid,
                "productID" : productid ,
                "name" : name,
                "image" : image,
                "price" : price])
        
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .response
        {
        response in
        
            do {
                print(response)
            }
            
            catch {
                
            }
        }
    }
func addtowishlist2(_ userid: Int, _ productid: Int, _ name: String, _ image: String,_ price : String) {
    
    print(MyModel().anytext)

    
    AF.request("http://localhost:8000/api/wishlist",method: .post,parameters: [
        
                "userID" : userid,
                "productID" : productid ,
                "name" : name,
                "image" : image,
                "price" : price])
        
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .response
        {
        response in
        
            do {
                print(response)
            }
            
            catch {
                
            }
        }
    }


func remove2(_ id: Int) {
    

    AF.request("http://localhost:8000/api/reduce/\(id)" , method: .get).responseJSON {(response) in
        
        let result = response.data

        do {
            
            let json = try JSONDecoder().decode([thisData].self,from:result!)
            addtoup()
            
            
            
        }catch{
            print(error)
        }
    }
}


func findid2() {
    
    
    
    guard let email = UserDefaults.standard.value(forKey: "email") else {return}
    
    print(email)
    
    AF.request("http://localhost:8000/api/findid/\(email)" , method: .get).responseJSON {(response) in
            
        
            let result = response.data
            
            do {
                
                let json = try JSONDecoder().decode([LoggedInUser1].self,from:result!)
                
                let usr = UserDefaults.standard.setValue(json[0].id, forKey: "usrid")
                
           
                
            }catch{
                print(error)
            }
        }
    
}


struct LoggedInUser2 : Decodable,Hashable {
    
    var id : Int
    var name : String
    var email : String
}


func areyok2() {
    print(2+2)
}
//
//struct ProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductView(show: true)
//        }
//}

