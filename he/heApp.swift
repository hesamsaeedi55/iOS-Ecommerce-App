//
//  heApp.swift
//  he
//
//  Created by Hesamoddin on 10/12/21.
//

import SwiftUI
import Alamofire

//import UIKit
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        heApp()
//
//
//        return true
//    }
//}

@available(iOS 15.0, *)
@main
struct heApp: App {

    @State private var showModal = false

    var body: some Scene {
        WindowGroup {
            
     
            if UserDefaults.standard.value(forKey: "email") == nil {
                //signUpView()
                swiftyJson()
                
            }else{
                            MainView( viewRouter: viewRouter())
            }
    
//                MainView(isPresendted: $showModal, viewRouter: viewRouter())
//                MainView(viewRouter: viewRouter())
    
            
        }
    }

}
