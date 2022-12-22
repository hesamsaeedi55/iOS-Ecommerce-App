//
//  ViewRouter.swift
//  he
//
//  Created by Hesamoddin on 9/16/21.
//

import SwiftUI

enum page {
    case home
    case profile
    case save
    case category
    case search
}


class viewRouter : ObservableObject {
    
    @Published var currentPage : page = .home
    
}


struct TabBarIcon : View {
    

//    @EnvironmentObject var appState : AppStateManager
    @StateObject var viewRouter :  viewRouter
    
    
    let width , height : CGFloat
    let icon : String
    let assignedPage : page
    
    
    var body: some View {
     
        
        Button(action: {
            
            
            viewRouter.currentPage = assignedPage
            print(assignedPage)
            
        }, label: {
      
        Image("\(icon)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width : 99 , height: height)
            .if(viewRouter.currentPage == assignedPage, transform: {
                $0.foregroundColor(assignedPage == .save ? Color.yellow : Color.red)
            })
            .padding(.horizontal, -12)
            
        
        })                 
        
    }
}

//
//struct TabBarIcon_Previews : PreviewProvider {
//    static var previews : some View {
//        TabBarIcon(viewRouter: viewRouter(), width: 22, height: 22, icon: "", assignedPage: .home)
//            .environmentObject(AppStateManager())
//    }
//}



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
//            .if(viewRouter.currentPage == assignedPage, transform: {
//                $0.foregroundColor(assignedPage == .star ? Color.yellow : Color.red)
//            })
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


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
