//
//  CustomSearchBar.swift
//  he
//
//  Created by Hesamoddin on 7/21/22.
//

import SwiftUI


@available(iOS 15.0, *)
struct CustomSearchBar: View {
    

    @ObservedObject var searchData : SearchProduct
    @State var showing : Bool = false
    @State var show = false

    var body: some View {
        ZStack {
        VStack(spacing: 0) {
            HStack(spacing:12) {
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.white)
                
                TextField("search",text: $searchData.query) {
                    UIApplication.shared.endEditing1()

                }
                    .autocapitalization(.none)
                    .modifier(ClearButton(text: $searchData.query))
                    .frame(height : 25)

       
        
                

            }
            .padding(.vertical,10)
            .padding(.horizontal)
            
            
            if !searchData.searchedProduct.isEmpty {
                ScrollView(.vertical,showsIndicators: true) {
                    // importan LazyVStack
                    
                    LazyVStack(alignment:.leading,spacing:12) {
                        ForEach(searchData.searchedProduct,id:\.self) { product in
                            
                            VStack(alignment:.leading,spacing:6) {
                                HStack {
                                Text(product.name)
                                        .onTapGesture {
                                            
                                            searchuserid(productid: product.id)
                                            show = true
                                            showing.toggle()
                                           
                                        }.sheet(isPresented: $showing, content: {
                                            ProductView2(product: product, name: product.name, imageLink: product.image, userClass: "")
                                        })
                                                                    }
                                Divider()
                            }
                            
                            
                            .padding(.horizontal)
                            .onAppear {
                                //stopping search until 3rd page
                                if product.id == searchData.searchedProduct.last?.id
//                                    && searchData.page <= 33
                                {
                                    searchData.page += 1
                                    searchData.find()
                                    
                                }else{
                                    print(product.id)
                                    print("searched ID : \(searchData.searchedProduct.last?.id)")
                                    print(page.self)
                                }
                                
                            }
                            
                        }
                    }
                    .padding(.top)
                }.frame(height: 140)
            }
            
            
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
        
            
//            NavigationLink(destination:ProductView(),isActive:$show,label:{})
       
        }         

        
    }
}

fileprivate
struct ClearButton: ViewModifier {
    @Binding var text: String
   
    public func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color.white)
                }
                .buttonStyle(PlainButtonStyle())
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding()
        .animation(.easeOut(duration: 0.3), value: text)
    }
}


func searchuserid(productid: Int) {
    
 
    
    
       
       let url =  "http://localhost:8000/api/show/\(productid)"

    
    print(url)
  

    let session = URLSession(configuration: .default)
    
    session.dataTask(with: URL(string: url)!) { (data, _,error) in
        
        guard let jsonData = data else {return}
        
        do {
            
            let products = try JSONDecoder().decode(Product.self, from: jsonData)
            
            print(products.price)
            print(products.image)
            print(products.entity)
            //appending to searchData
            
            
            
        }catch {
            print(error)
        }
        
    }.resume()
    
    
    
    
}


//struct CustomSearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSearchBar(searchData: SearchProduct())
//    }
//}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
