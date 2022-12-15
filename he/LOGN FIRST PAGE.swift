//
//  swiftyJson.swift
//  he
//
//  Created by Hesamoddin on 10/29/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON


//MARK: passing data between views 1
class MyModel: ObservableObject {
    
    @Published var anytext : String = ""
    @Published var anytext2 : String = ""
    
}



@available(iOS 15.0, *)
struct swiftyJson: View {

//
//    func login() {
//
//        AF.request( "http://localhost:8000/api/login",method: .post,
//                   parameters: [
//
//                    "email" : UserDefaults.standard.value(forKey: "email")! ,
//                    "password" : UserDefaults.standard.value(forKey: "pass")!
//
//                   ])
//
//                .validate(statusCode: 200..<300)
//                .validate(contentType: ["application/json"])
//                .response
//
//            {  response in
//
//                if response.error == nil {
//
//                    let doit = try! JSONDecoder().decode(token.self , from: response.data!)
//
//                    //MARK: passing data between views 3
//                    if email != "" {
//
//                            emailPassed.anytext = email
//
//                    }else{
//
//                        emailPassed.anytext = UserDefaults.standard.value(forKey: "email") as! String
//
//                    }
//
//                    isAuth = true
//
//                 }else{
//                    print("ERROR")
//                }
//        }
//
//    }
    
    
    struct new : Decodable,Hashable {
        var current_page : Int
        var data : [data]
    }
    
    
    struct data : Decodable,Hashable {
                
        var id : Int!
        var name : String!
        var description : String!
        
        init(id:Int,dictionary:Dictionary<String,AnyObject>) {
            self.id = id
            
            if let name = dictionary["name"] as? String {
                self.name = name
            }
            if let description = dictionary["description"] as? String {
                self.description = description
            }
        }
        
    }
    

    //MARK: passing data between views 2
    @StateObject var emailPassed = MyModel()
    @StateObject var passwordPassed = MyModel()


  
    
    

    
    @State private var isSignUp = false
    @State private var isAuth = false

    var home = Home()
    
    struct token : Decodable {
        
        var access_token : String = ""
        
        init(access_token:String = "" ) {
            self.access_token = access_token
        }
        
    }
    
    struct message : Decodable {
        var message : String = ""
        
        init(message:String = "" ) {
            self.message = message
        }
    }

    
    
    @State var email : String = ""
    @State var pass : String = ""

    
    var body: some View {
        
        NavigationView {
        ZStack {
            

            VStack {

                VStack(spacing: 14) {
                    Spacer()

                    CustomTextField(placeholder: Text("email").foregroundColor(.blue),text: $email)
                        .autocapitalization(.none)
                        .frame(width:UIScreen.main.bounds.width/1.5)
                        .disableAutocorrection(true)
                  
                        .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke()
                            .stroke(lineWidth: 0.5)

                        )
                   
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        



                CustomTextField(placeholder: Text("password").foregroundColor(.blue),text: $pass)
                    .autocapitalization(.none)
                    .frame(width:UIScreen.main.bounds.width/1.5)
                    .disableAutocorrection(true)

                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke()
                            .stroke(lineWidth: 0.5)
                            .foregroundColor(.white)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    
//                    Button("GET ITEMS") {
//
//                        AF.request("http://localhost:8000/api/show/\(email)" , method: .get).responseJSON {(response) in
//
//                            let result = response.data
//
//                            do {
//
//                                let json = try JSONDecoder().decode(new.self,from:result!)
//
//                                print(json.data)
//                                print(json.current_page)
////                                for eachitem in self.id {
////                                    print(eachitem)
////                                    DispatchQueue.main.async {
////
////                                    }
////                                }
//
//                            }catch{
//                                print(error)
//                            }
//                        }
//                    }
                    
                    
                    Group {
//                    Button("SEARCH") {
//
//                        AF.request("http://localhost:8000/api/find/\(email)",method: .get ).responseJSON {(response) in
//
//                            let result = response.data
//
//                            do {
//                              self.id = try JSONDecoder().decode([data].self, from: result!)
//                              for eachmahsul in self.id {
//                                  print(eachmahsul.id)
//                                    DispatchQueue.main.async {
//
//                                }
//                              }
//                            }catch{
//                                print(error)
//                            }
//                        }
//
//
//                    }
                    
                                        
                    Button("LOGIN") {
                        
                        findID()

                        AF.request("http://localhost:8000/api/login",method: .post,parameters: ["email" : email , "password" : pass])
                        

                            .validate(statusCode: 200..<300)
                            .validate(contentType: ["application/json"])
                            .response
                        { response in

      //                          print(response.error)
      //                          print(response.result)
      //                          print(response.data)
      //                          print(response.response?.statusCode)
      //

                            if response.error == nil {
                                print(token.self)
                             let doit = try! JSONDecoder().decode(token.self , from: response.data!)
                                    
                            print(doit.access_token)
                                    
                                    //MARK: passing data between views 3
                                    
                                    emailPassed.anytext = email
                                    passwordPassed.anytext2 = pass
                                    
                                    
                                    
                                    opt(email,pass)
                                    

                                    
                                    isAuth = true
                                    

                                 }else{
                                    print("ERROR")
                                }
                        }


                    }
                    
                    .font(Font.custom("Stadium-Display", size: 60))
                    .foregroundColor(.white)
                    .onAppear(perform: {
                        
                        if UserDefaults.standard.value(forKey: "email") != nil && UserDefaults.standard.value(forKey: "pass") != nil {
                            
                        findID()
                            AF.request("http://localhost:8000/api/login",method: .post,parameters:
                                        ["email" : UserDefaults.standard.value(forKey: "email")!,
                                        "password" : UserDefaults.standard.value(forKey: "pass")!])

                            .validate(statusCode: 200..<300)
                            .validate(contentType: ["application/json"])
                            .response
                        { response in

      //                          print(response.error)
      //                          print(response.result)
      //                          print(response.data)
      //                          print(response.response?.statusCode)
      //

                                if response.error == nil {
                                    
                             let doit = try! JSONDecoder().decode(token.self , from: response.data!)
                            print(doit.access_token)
                                    
                                    //MARK: passing data between views 3
                                    emailPassed.anytext = email
                                    passwordPassed.anytext2 = pass
                                    
                                    opt(email,pass)

                                    
                                    isAuth = true
                                    
                              

                                 }else{
                                    print("ERROR")
                                }
                        }
                        }
                    })
                   
                
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button("don't have an account? sign up")
                    {
                        isSignUp.toggle()
                    }.foregroundColor(.white)

                    }
                        
                        
                }.onAppear(perform: {
                    
                    for family in UIFont.familyNames.sorted() {
                        let names = UIFont.fontNames(forFamilyName: family)
                        print("Family: \(family) Font names: \(names)")
                    }
                    
                })
                  

               
                }
            
                
                  NavigationLink(destination: signUpView(), isActive : $isSignUp,label:{})




            
        }
        
        
        
        .background(Image("4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height , alignment: .center))
            
        }
        .fullScreenCover(isPresented: $isAuth, content: {
            MainView(viewRouter: viewRouter())
        })
//        .fullScreenCover(isPresented: $isAuth, content: {
//            signUpView()
//        })
     
        //MARK: pass data between views 4
        .environmentObject(emailPassed)
        .environmentObject(passwordPassed)

  
    }
    
}

struct newid : Decodable,Hashable {
    let id : Int
}


func findID() {
    
    AF.request("http://localhost:8000/api/findid/1111@gmail.com",method: .get).responseJSON { (response) in
        
        let result = response.data
        
        do {
        
        let json = try JSONDecoder().decode([newid].self,from:result!)
//            print(json[0].id)
            
//            UserDefaults.standard.setValue(json[0].id, forKey: "id")
            
            
        }catch{
           
                print(error)
            }
        }
    
    }
    

func opt(_ email : String, _ pass : String ) {
    
    let em = email
    let ps = pass
    let defaults =   UserDefaults.standard
    defaults.setValue(em, forKey: "email")
    defaults.setValue(ps, forKey: "pass")
    
    
}


@available(iOS 15.0, *)
struct swiftyJson_Previews: PreviewProvider {
    static var previews: some View {
        swiftyJson()
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
