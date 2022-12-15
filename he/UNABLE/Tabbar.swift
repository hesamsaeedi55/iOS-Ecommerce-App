////
////  ViewRouter.swift
////  TINDER
////
////  Created by Hesamoddin on 9/16/21.
////
//
//import SwiftUI
//
//class ViewRouter : ObservableObject {
//    
//    @Published var currentPage : page = .fire
//    
//}
//
//
//enum page  {
//    case fire
//    case star
//    case message
//    case profile
//}
//
//struct TabBarIcon: View {
//    
//    @StateObject var viewRouter: ViewRouter
//    
//    // if we cut the StateObject off the red and other colors of icons won't change
//    
//    let assignedPage : page
//    let width , height : CGFloat
//    let icon  : String
//    
//    var body: some View {
//        Image(systemName:icon)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        
////            .if(viewRouter.currentPage == assignedPage, transform: {
////                $0.foregroundColor(assignedPage == .star ? Color.yellow : Color.red)
////            })
//            
//                .frame(width: width, height: height)
//            
//                .onTapGesture {
//                    viewRouter.currentPage = assignedPage
//                    
//                }
//        
//    }
//}
