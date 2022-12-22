
//
//  ContentView.swift
//  he
//
//  Created by Hesamoddin on 8/31/21.
//

import SwiftUI
import Alamofire


@available(iOS 15.0, *)
struct MainView : View {
    
    var height =  UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.size.width
    
//    @Binding var isPresendted: Bool
    @State private var showModal = false

   
    @State var isAuth = false
    
    @State var isUpdate = false

    
    struct token : Decodable {
        
        var access_token : String = ""
        
        init(access_token:String = "" ) {
            self.access_token = access_token
        }
        
    }
    
    @StateObject var emailPassed = MyModel()
    @StateObject var passwordPassed = MyModel()

    
    @StateObject var viewRouter : viewRouter

    var body: some View {
        GeometryReader { geo in
        ZStack {
            
        VStack {
            
            switch viewRouter.currentPage {
            
            case .home :
                category()
                    .padding(.bottom,-8)

            case .save :
                RepositoriesListContainer3(viewModel: RepositoriesViewModel3())
                    .padding(.bottom,-8)

            case .category :
                Home1()
                    .padding(.bottom,-18)

//                eynak( viewRouter2: ViewRouter2())
                
            case .profile :
                ContentView1(searchData: SearchProduct())
                    .padding(.bottom,-8)

//                RepositoriesListContainer2(viewModel: RepositoriesViewModel2(catStyle: ""))
//                    .padding(.bottom,-8)
            case .search :
//                CustomSearchBar(searchData: SearchProduct())
//                    .padding(.bottom,-8)
                
                Home1()
                    .padding(.bottom,-18)

//                ProductView(show: Binding<Bool>)
//                    .padding(.bottom,-8)

            }
            
            Spacer()
            
            HStack(spacing: 1) {

                TabBarIcon(viewRouter: viewRouter, width: geo.size.width/1.2, height: geo.size.height/28, icon: "2", assignedPage: .home)
                
                TabBarIcon(viewRouter: viewRouter, width: geo.size.width/1.6, height: geo.size.height/28, icon: "15", assignedPage: .search)
                
                TabBarIcon(viewRouter: viewRouter, width: geo.size.width/1.2, height: geo.size.height/28, icon: "22", assignedPage: .category)

//                TabBarIcon(viewRouter: viewRouter, width: geo.size.width/1.6, height: geo.size.height/28, icon: "16", assignedPage: .profile)
                
                TabBarIcon(viewRouter: viewRouter, width: geo.size.width/1.2, height: geo.size.height/28, icon: "13", assignedPage: .save)
            }
            


            .fullScreenCover(isPresented: $isAuth) {
                swiftyJson()
            }

            .frame(width: geo.size.width, height: height/14)
            .background(Color.gray)
            .ignoresSafeArea(.keyboard, edges: .bottom)

          
            
        }.ignoresSafeArea(.keyboard, edges: .bottom)

            

        }

            
            
        }
        .onAppear(perform: {
            thisUpdate()
        })
        .environmentObject(emailPassed)
        .environmentObject(passwordPassed)

       
        
    }
    
    func thisUpdate() {
        

        
        if UserDefaults.standard.value(forKey: "email") == nil {
            
//            isAuth.toggle()
            
        }else{
            

        
        AF.request("http://localhost:8000/api/login",method: .post,parameters: [
           
            
                    "email" : UserDefaults.standard.value(forKey: "email")! ,
                    "password" : UserDefaults.standard.value(forKey: "pass")!
        
        
        
        ])

            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .response
            
        
        { response in

//                          print(response.error)
//                          print(response.result)
//                          print(response.data)
//                          print(response.response?.statusCode)
//
                print(response.error)
            
                if response.error == nil {
                    
             let doit = try! JSONDecoder().decode(token.self , from: response.data!)
            print(doit.access_token)
                    
                    //MARK: passing data between views 3
                    emailPassed.anytext = UserDefaults.standard.value(forKey: "email") as! String
                    passwordPassed.anytext2 = UserDefaults.standard.value(forKey: "pass") as! String

                        
                    
                    
                    
//                        opt(email,pass)
                    

                    
              

                 }else{
                    print("ERROR")
                }
            }
        }

    }
    
}


@available(iOS 15.0, *)
struct MainView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            MainView(viewRouter: viewRouter())
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))

        }

    }
}










//struct MainView: View {
//
//    @StateObject var viewRouter : ViewRouter
//
//
//    var body: some View {
//
//        NavigationView {
//        ZStack {
//            Color(.systemGray6).opacity(0.35)
//                .edgesIgnoringSafeArea(.vertical)
//
//            VStack {
//
//                        HStack(spacing: 50) {
//
//                            TabBarIcon(viewRouter: viewRouter, assignedPage:.fire, width: 22.0, height: 22.0, icon: "flame.fill")
//                            TabBarIcon(viewRouter: viewRouter, assignedPage:.star
//                                       , width: 22.0, height: 22.0, icon: "star.fill")
//                            TabBarIcon(viewRouter: viewRouter, assignedPage:.message, width: 22.0, height: 22.0, icon: "message.fill")
//                            TabBarIcon(viewRouter: viewRouter, assignedPage:.profile, width: 22.0, height: 22.0, icon: "person.fill")
//                        }.padding(.bottom, 10)
//
//
//
//
//
//                Spacer()
//            }
//
//            }
//        }
//
//}
//
