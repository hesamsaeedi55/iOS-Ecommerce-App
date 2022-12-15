//
//  swiftyJson.swift
//  he
//
//  Created by Hesamoddin on 10/29/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct sampleUser {
    var name : String
    var email : String
}

struct LoggedInUser : Decodable,Hashable {
    
    var id : Int
    var name : String
    var email : String
}

@available(iOS 15.0, *)
struct signUpView: View {
    
    @StateObject var emailPassed = MyModel()
    @StateObject var passwordPassed = MyModel()
   
   @State private var user = userdetails()
    
    
    @State private var isAuth = false

    
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

    
    let api = APISIGNUP()
    
    @State var name : String = ""
    @State var email : String = ""
    @State var pass : String = ""
    
    


    var body: some View {
        NavigationView {
            GeometryReader { geo in
          
                        
        
                VStack(spacing:22) {
            
                Group {
                    
                    TextField("name", text: $name )
                    
                    TextField("email", text: $email)

                    TextField("password", text: $pass)
                }
                .foregroundColor(.black)
                .frame(width: geo.size.width/1.8, height: geo.size.height/19)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .background(Color.green)
                .multilineTextAlignment(.center)
                .cornerRadius(5)

        
        Button("login") {
            
            
            AF.request("http://localhost:8000/api/register",method: .post,parameters: [
                        "name" : name,
                        "email" : email ,
                        "password" : pass])
                
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .response
                
                
                    {
                        
                    response in
                    
             
          
           
                    if response.error == nil {
                        
                        opt(email, pass)
                        
                        print(email)
                        print(pass)
                        print(UserDefaults.standard.value(forKey: "email"))
                        print(UserDefaults.standard.value(forKey: "pass"))


                        let doit = try! JSONDecoder().decode(token.self , from: response.data!)
                        

                        
                        print(doit.access_token)
                        isAuth = true
                        
                        user.name = name
                        user.email = email
                        
                        emailPassed.anytext = email
                        passwordPassed.anytext2 = pass


                     }else{
                        print("ERROR")
                    }
            }
            
                
        }
            
//            NavigationLink(destination: MainView(viewRouter: viewRouter()),isActive: $isAuth,label:{})
//                .navigationBarBackButtonHidden(true)
                .fullScreenCover(isPresented: $isAuth, content: {
                    MainView(viewRouter: viewRouter())
                })

//            NavigationLink(destination: userHome(username: user), isActive : $isAuth,label:{})
            }
            .padding(geo.size.width/6.6)
            .background(Color.gray)
            .cornerRadius(40)
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
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

}
 



class APISIGNUP {
    
    let base = "http://localhost:8000/api/register"

func register(params: [String : String], callback: @escaping (JSON)->()) {
    
    let headers : HTTPHeaders = [
        "Accept" : "Application/json",
        "Content-Type" : "Application/json"
    ]
    
    AF.request(base,method: .post,parameters: params,headers: headers) { (response) in
        callback(JSON(response.value as Any))
        }
    
    }
}


//struct signUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        signUpView()
//    }
//}
