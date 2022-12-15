//
//  category.swift
//  he
//
//  Created by Hesamoddin on 5/18/22.
//

import SwiftUI


@available(iOS 15.0, *)
struct category: View {
    
    
    
    
    var categorymen = ["NEW","T-SHIRTS","PANTS","BOOKS","JACKETS","BASICS","JEANS","SHORTS"]
    
    
    var categorywomen = ["NEW2","T-SHIRTS2","PANTS2","STATUES2","JACKETS2","BASICS2","JEANS2","SHORTS2"]
    
    
    
    @State var which = false
    @State private var showingSheet = false
    @State var done = false

    
    
    var body: some View {
        NavigationView {
        ZStack {
            
            VStack(alignment: .leading) {
            
                
                    HStack(spacing: 100) {
                        Button(action: {
                            
                            which = false
                            
                        }, label: {
                            Text("WOMEN")
                        })
                        Button(action: {
                            
                            which = true
                            
                        }, label: {
                            Text("MEN")
                        })
                        
                    }
                    .padding(55)
                
                ScrollView {
                    
                    VStack(alignment:.leading,spacing: 20) {
                        if which == false {
                            ForEach(0..<categorymen.count,id:\.self) { index in
//
////
//                                Button(categorymen[index],action: {
//
//                                    if ft == true {
//                                        nop = index + 1
//
//                                    }else{
//                                        nop = index
//                                    }
//                                    print(nop)
//                                    done.toggle()
//                                })
//                                .fullScreenCover(isPresented: $done , content: {
//                                RepositoriesListContainer(viewModel: RepositoriesViewModel(
//                                    catStyle: nop))})
//
                                
                                NavigationLink(destination: RepositoriesListContainer(viewModel: RepositoriesViewModel(catStyle: index))) {

                                        Text(categorymen[index])

                                }
                              
//                }.sheet(isPresented: $showingSheet) {
//
//
//                    RepositoriesListContainer(viewModel: RepositoriesViewModel())
//
//                                }
                                
                            }
                        }else{
                        ForEach(0..<categorywomen.count,id:\.self) { index in
                            Button(action: {}, label: {
                                Text(categorywomen[index])
                                
                                })
                            
                            }
                        }

                    }
                }
                
                
            }
          }.ignoresSafeArea()
        }
    }
}

@available(iOS 15.0, *)
struct category_Previews: PreviewProvider {
    static var previews: some View {
        category()
    }
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `iff`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
