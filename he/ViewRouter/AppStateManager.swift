//
//  AppStateManager.swift
//  MainTab
//
//  Created by Hesamoddin on 11/26/21.
//

import Foundation
//
//class AppStateManager : ObservableObject {
//    @Published var selectedTab : TabBarButtonType = .fire
//}

class AppStateManager : ObservableObject {
    
    @Published var selectedTab : page = .home
    
    @Published var test : Int = 0
    
}
