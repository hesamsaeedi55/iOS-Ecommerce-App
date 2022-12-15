//
//  Glass.swift
//  he
//
//  Created by Hesamoddin on 10/14/21.
//

import SwiftUI



@available(iOS 15.0, *)
struct Home : View {
    @State private var isLogout = false

    //MARK: passing data between views 4
    @EnvironmentObject var settings: MyModel
    @State private var showModal = false

    @ViewBuilder
    var body: some View {
        NavigationView {
        
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BG1"), Color("BG2")]), startPoint: .top, endPoint: .bottom)
            GeometryReader { proxy in
                let size = proxy.size

                Color.black
                    .opacity(1)
                
                Circle()
                    .fill(Color("Purple"))
                    .blur(radius: 120)
                    .padding(50)
                    .offset(x: -size.width / 1.8 , y: -size.height / 5)
                Circle()
                    .fill(Color("LightBlue"))
                    .blur(radius: 150)
                    .padding(50)
                    .offset(x: size.width / 1.8 , y: -size.height / 2)
                Circle()
                    .fill(Color("LightBlue"))
                    .blur(radius: 90)
                    .padding(50)
                    .offset(x: size.width / 1.8 , y: size.height / 2)
                Circle()
                    .fill(Color("Purple"))
                    .blur(radius: 110)
                    .padding(100)
                    .offset(x: size.width / 1.8 , y: size.height / 2)
                Circle()
                    .fill(Color("Purple"))
                    .blur(radius: 110)
                    .padding(100)
                    .offset(x: -size.width / 1.8 , y: size.height / 2)
                Circle()
                    .fill(Color.orange)
                    .blur(radius: 150)
                    .padding(100)
                    .offset(x: size.width / 1.8 , y: size.height / 10)
                
            }
            
            VStack {
                Spacer(minLength: 10)
                glassMorphicCard()
                Spacer(minLength: 10)
                Text("Know Everything\nAbout Weather")
                    .font(.system(size: 40,weight:.bold))
                    .foregroundColor(.white)
                Text("Start Now And Learn More About \n Local Weather Instantly")
                    .padding(.top)
                    .foregroundColor(.white)
                
                if settings.anytext != "" {
                    
                Text("\(settings.anytext)")
                    .padding(.top)
                    .foregroundColor(.white)
                    
                }else{
                    
                    Text("Email Not Found")
                    
                }
              
                
                
                Button("logout") {
                    
                   
                    showModal.toggle()
    
                    
                    
                   UserDefaults.standard.removeObject(forKey: "email")
                    UserDefaults.standard.removeObject(forKey: "pass")

                    
                    
                    
                }.fullScreenCover(isPresented: $showModal, content: {
                    wholeView()
                })
                
            }.multilineTextAlignment(.center)
            .padding(.bottom , 40)
            
            
        }.edgesIgnoringSafeArea(.all)
        
        }
        
    }
    
//    func getAttributedString() -> NSAttributedString {
//        let attstr = NSAttributedString(string: "Start Now And Learn More About \n Local Weather Instantly")
//        attstr.col
//    }
}


struct glassMorphicCard: View {
    
    var name : String = "test"
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height

        

        ZStack {
            Image("11")
                .resizable()
                .cornerRadius(26)
                .frame(width: width / 1.5, height: height / 2.1)
                .shadow(color:Color("LightBlue") ,radius: 4 )
                .opacity(1)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .opacity(0.1)
                .background(
                    Color.white
                        .opacity(0.02)
                        .blur(radius: 25)
                        .cornerRadius(12)

                )
                .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color("Purple"),
                                                                   Color("Purple").opacity(0.5),
                                                                   .clear,
                                                                   .clear,
                                                                   Color("LightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        
                        ,lineWidth: 2.5
                    )
                    .padding(2)
                    
                )
                .shadow(color: Color.black.opacity(0.5), radius: 50, x: -5, y: -5)
                .shadow(color: Color.black.opacity(0.5), radius: 50, x: -5, y: -5)

            
        } .frame(width: width / 1.4, height: height / 2)

    }
}




@available(iOS 15.0, *)
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


