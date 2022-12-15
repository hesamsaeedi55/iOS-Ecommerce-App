//
//  SwiftUIView.swift
//  he
//
//  Created by Hesamoddin on 11/22/21.
//

import SwiftUI


struct userHome: View {
    
    @State var username : userdetails
    
    var body: some View {
        VStack {
        Text(username.name)
        Text(username.email)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        userHome(username: userdetails.example)
    }
}
