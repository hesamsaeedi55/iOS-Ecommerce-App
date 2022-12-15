//
//  Detail.swift
//  shapes
//
//  Created by Hesamoddin on 12/16/21.
//

import SwiftUI

//class classViewModel : ObservableObject {
//    @Published var newclass : customer?
//}

struct Detail: View {
    @Binding var selectedItem: item
    @Binding var show : Bool
    @State var loadContent = false
    @State var once = false
    var animation : Namespace.ID
    var cust : customer?
//    @ObservedObject var cst = classViewModel()

    var body: some View {
        
        VStack {
            HStack(spacing:25) {
                
                Button(action:{
                    
                    withAnimation(.spring()) {show.toggle()}
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                    
                }
                
                Spacer()
                Button(action:{}) {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Button(action:{}) {
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            .padding()
           
            VStack {
             
                TabView() {
                    
                    ForEach(selectedItem.image,id:\.self) { imageof in
                        Image(imageof)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    // since id is common
//                            .if(once == false, transform: {
//                                    $0
//                                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                                
//                            })
                            
                    .padding()
                        }
                }.tabViewStyle(PageTabViewStyle())
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline : .now() + 2, execute:{
                        once = true
                    })
                })
                
                
                
                Text(selectedItem.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(selectedItem.subtitle)
                    .foregroundColor(.gray)
                    .padding(.top,4)
                
                HStack {
                    
                    
                    Text(selectedItem.rating)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                    
                    Spacer()
                    
                    Button(action : {
                        
                        
//                        self.cust!.wishList.append(selectedItem)
                        print(cust!.wishList.count)
                        
                    }) {
                        Image(systemName: "suit.heart")
                            .font(.title2)
                            .foregroundColor(.black)
                        
                    }
                    .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)

                   
                }
                .padding()
            }
            .padding()
            .background(
                Color.green
                
                    .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)

            )
            .cornerRadius(15)
            .padding()
            
            //delay animation for smooth
            
            VStack {
                
                VStack(alignment :.leading, spacing: 8) {
                    Text("exclusive offer")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Text("frame + lens for $35 ")
                        .foregroundColor(.gray)
                    
                }.padding()
                .frame(width: UIScreen.main.bounds.width - 30 ,alignment: .leading)
                .background(Color.red.opacity(0.2))
                .cornerRadius(12)
                
            }.padding([.horizontal,.bottom])
            .frame(height: loadContent ? nil : 0)
            .opacity(loadContent ? 1 : 0)
            //for smooth transition
                        
            Spacer(minLength: 0)
        }.onAppear {
            
            withAnimation(Animation.spring().delay(0.45)) {
                
                loadContent.toggle()
                
            }
            
                }
            }
}
//
//struct Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        Detail(selectedItem: items[0])
//        )
//    }
