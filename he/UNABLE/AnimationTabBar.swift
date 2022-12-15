//
//  AnimationTabBar.swift
//  he
//
//  Created by Hesamoddin on 10/21/21.
//

import SwiftUI

struct AnimationTabBar: View {
    @State var currentTab : Int = 0
    var body: some View {
        ZStack(alignment:.top) {
            
          
            TabBarView(currentTab: self.$currentTab)

        }

    }
}

struct TabBarView : View {
    @Binding var currentTab : Int
    var tabBarOptions  = ["one is cool", "two" ,"twoplustwo"]
    var body: some View {
        ScrollView {
            HStack(spacing:20) {
                
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        
                        id: \.0,
                        content: {
                            index , name in
                            
                            tabBarItem(currentTab: self.$currentTab, tabBarName: name, tab: index)
                        })
            }
        }
        background(Color(.white))
        frame(height: 80)
    }
}


struct tabBarItem: View {
    @Binding var currentTab : Int
    var tabBarName : String
    var tab : Int
    
    var body: some View {
        Button(action: {
            self.currentTab = tab
        }, label: {
            VStack{
            Spacer()
            Text(tabBarName)
            }
        })
    }
}

struct AnimationTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTabBar()
    }
}
