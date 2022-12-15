//
//  TabButton.swift
//  shapes
//
//  Created by Hesamoddin on 12/16/21.
//

import SwiftUI
import Foundation



enum TabBarButtonType : String {
    case fire
    case star
    case message 
    case profile
}

struct TabButton: View {
    
  
    
    var title : String
    var animation : Namespace.ID
    @Binding var selected : String
    @EnvironmentObject var appState : AppStateManagers

    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {selected = title}
            
        }) {
            
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical,10)
                .padding(.horizontal, selected == title ? 20 : 0)
                .background(
                
                    ZStack {
                        if selected == title {
                            Color.black
                               .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }

                )
        }
      
    }
}


class AppStateManagers : ObservableObject {
    
    @Published var selectedTab : TabBarButtonType = .fire
    
    @Published var showPersonProfile : Person? = nil
    
    @Published var showPurchasePopUp : Bool = false
    
    public func showPersonProfile(_ person : Person) {
        self.showPersonProfile = person
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopUp = true
    }
}

