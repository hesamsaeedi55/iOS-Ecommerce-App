//
//  newDesign.swift
//  InfiniteListSwiftUI
//
//  Created by Hesamoddin on 3/18/22.
//  Copyright © 2022 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct newDesign: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
        Text("Hello, World!")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct newDesign_Previews: PreviewProvider {
    static var previews: some View {
        newDesign()
    }
}
