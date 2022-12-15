//
//  testView.swift
//  he
//
//  Created by Hesamoddin on 4/19/22.
//

import SwiftUI


@available(iOS 15.0, *)
struct wholeView : View {
    let i = false
    var body: some View {
     
        if UserDefaults.standard.value(forKey: "email") != nil {
            MainView(viewRouter: viewRouter())
        }else{
            swiftyJson()
        }
        
    }
}

extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
