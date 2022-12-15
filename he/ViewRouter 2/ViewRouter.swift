//
//  ViewRouter.swift
//  he
//
//  Created by Hesamoddin on 7/17/22.
//


//
//  ViewRouter.swift
//  TINDER
//
//  Created by Hesamoddin on 9/16/21.
//

import SwiftUI

class ViewRouter2 : ObservableObject {
    
    @Published var currentPage : page2 = .fire
    
}


enum page2  {
    case fire
    case star
    case message
    case profile
}

struct TabBarIcon2: View {
    
    @StateObject var viewRouters: ViewRouter2

    // if we cut the StateObject off the red and other colors of icons won't change
    
    let assignedPage2 : page2
    let width , height : CGFloat
    let icon  : String
    
    var body: some View {
        Image(systemName:icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
        
            .if(viewRouters.currentPage == assignedPage2, transform: {
                $0.foregroundColor(assignedPage2 == .star ? Color.yellow : Color.red)
            })
            
                .frame(width: width, height: height)
            
                .onTapGesture {
                    viewRouters.currentPage = assignedPage2
                    
                }
        
    }
}
