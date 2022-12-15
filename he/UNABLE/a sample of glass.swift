
import SwiftUI

struct txtLogin : View {
    @State var email : String
    var width = UIScreen.main.bounds.size.width
    var heighter = UIScreen.main.bounds.size.height

    var body: some View {
        
        ZStack {
            Color.black
            glassMorphicCardTest(name: "few")
        }
        

        
    }
}

struct txtLogin_Previews: PreviewProvider {
    static var previews: some View {
        txtLogin(email: "")
    }
}


struct glassMorphicCardTest: View {
    
    @State var name : String
    @State var index = 0

    var images = ["1", "2", "3", "1"]

    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height

        

        ZStack {

            VStack {
           
        Text(name)
            .foregroundColor(.white)
                Text("description : It's a test")
                    .foregroundColor(.white)
            }
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
              
            
        } .frame(width: width / 2.2, height: height / 3)
        .padding(2)
        
        

    }
}
