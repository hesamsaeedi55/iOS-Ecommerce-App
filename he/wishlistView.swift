//
//  RepositoriesList.swift
//  InfiniteListSwiftUI
//
//  Created by Vadim Bulavin on 6/10/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI
import Combine
import Alamofire


//var num = 0
// var catStyle: Int!

class RepositoriesViewModel3: ObservableObject {
    
//    var catStyle : Int
//    init(catStyle:Int) {
//        self.catStyle = catStyle
////        num = catStyle
//    }
    
    @Published private(set) var state = State3()
    private var subscriptions = Set<AnyCancellable>()
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage else { return }
        GithubAPI3.searchRepos(page: state.page, cat: UserDefaults.standard.value(forKey: "usrid") as! Int )
            .sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
        }
    
    
    
    
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            state.canLoadNextPage = false
        }
    }
    
    
    

    private func onReceive(_ batch: [Repository3]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = (batch.count != 0)
    }
    
    
    

    struct State3 {
        var repos: [Repository3] = []
        var page: Int = 1
        var canLoadNextPage = true

    }
}


var sampleuser3 : sampleUser!




@available(iOS 15.0, *)
struct RepositoriesListContainer3: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: RepositoriesViewModel3
    
    var body: some View {
        Button("Dismiss") {
                   presentationMode.wrappedValue.dismiss()
               }
        RepositoriesList3(
            repos: viewModel.state.repos,
            isLoading: viewModel.state.canLoadNextPage,
            onScrolledAtBottom: viewModel.fetchNextPageIfPossible
        )

        .onAppear(perform: viewModel.fetchNextPageIfPossible)
    
    }

}



//MARK: MAIN REPOSITORYLIST

@available(iOS 15.0, *)
struct RepositoriesList3: View {
    let repos: [Repository3]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {


                   
        VStack {
//            Button("refresh") {
//                self.onScrolledAtBottom()
//
//            }
     
            reposList3
               
            if isLoading {
                loadingIndicator
            }
     
        }
       
    }
        
    
//    let repo: Repository

    private var reposList3: some View {
        
//        ForEach(repos) { repo in/
            ScrollView(.vertical,content :{
                
                        LazyVGrid(columns: [GridItem(.flexible())],
                      alignment: .leading,
                      spacing:0,
                      content: {
                            
                            ForEach(repos) { repo in
                                RepositoryRow3(repo: repo).onAppear{
                                    if self.repos.last == repo {
                                        self.onScrolledAtBottom()
                                    }
                                }
//                            .onTapGesture {
//                                print(repo.id)
//                            }
                        .frame(height:30)
                           }
                      })
                        .padding(12)
                
            }
            
            )
//            RepositoryRow(repo: repo).onAppear {
//                if self.repos.last == repo {
//                    self.onScrolledAtBottom()
//                }
//            }
//        }
    }
}


    private var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
        
}


//MARK: CELLS VIEW
@available(iOS 15.0, *)
struct RepositoryRow3: View {
    
  
    
    let repo: Repository3
    
    @State var showingSheet = false
    var body: some View {
       
            
                    Text(repo.name)
//            ProductsSquare(product: repo, blur: false, name: repo.name, imageLink: repo.image)
//                .onTapGesture {
//                    showingSheet.toggle()
//                    findid()
//                    findwid(UserDefaults.standard.value(forKey: "usrid") as! Int, repo.id)
//                }
//                .sheet(isPresented: $showingSheet) {
//                    ProductView(product: repo, name: repo.name, imageLink: repo.image, userClass: "")
//                        }
//
//                .ifs(repo.entity == 0, transform: { view in
//                    view.background(Color.red)
//                }
//
//                )
            //        VStack {
            //            Text(repo.name)
            //                .padding()
            //                .ifs(repo.entity == 0 , transform: { view in
            //                    view.background(Color.red)
            //                })
            //                .background(Color.yellow)
            //
            //                .onTapGesture {
            //
            //                    if  repo.entity == 0 {
            //                        print("SOLD OUT")
            //                    }
            //
            //
            //                    print(repo.id)
            //
            //                    UserDefaults.standard.setValue(repo.id, forKey: "repoid")
            //                    print( UserDefaults.standard.value(forKey: "id") as! Int)
            //                    if let value = UserDefaults.standard.value(forKey: "repoid"){
            //                                let selectedIndex = value as! Int
            //                                print(selectedIndex)
            //                            }
            //                    tappedUrl(repo.id)
            //                }
            //
            //            if repo.entity == 0 {
            //
            //            }
            //
            //        }
                .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
    
    func findid() {
        
        
        
        guard let email = UserDefaults.standard.value(forKey: "email") else {return}
        
        print(email)
        
        AF.request("http://localhost:8000/api/findid/\(email)" , method: .get).responseJSON {(response) in
                
            
                let result = response.data
                
                do {
                    
                    let json = try JSONDecoder().decode([LoggedInUser1].self,from:result!)
                    
                    let usr = UserDefaults.standard.setValue(json[0].id, forKey: "usrid")
                    
               
                    
                }catch{
                    print(error)
                }
            }
        
    }
    
    
}



struct thisData3 : Decodable {
    let name : String
}


//MARK: TAPPED URL

func tappedUrl3(_ id: Int) {
    

    AF.request("http://localhost:8000/api/reduce/\(id)" , method: .post).responseJSON {(response) in
        
        let result = response.data

        do {
            
            let json = try JSONDecoder().decode([thisData3].self,from:result!)
            addtoup()
            
            
            
        }catch{
            print(error)
        }
    }
}

struct WID3 : Decodable,Hashable {
    
    var userID : Int
    var productID : Int
}

func findwid3(_ uid: Int, _ pid: Int) {
    
    
    
    guard let email = UserDefaults.standard.value(forKey: "usrid") else {return}
    
    print(email)
    
    AF.request("http://localhost:8000/api/wishlist/\(uid)/\(pid)" , method: .get).responseJSON {(response) in
            
        
            let result = response.data
            
            do {
                
                let json = try JSONDecoder().decode([WID].self,from:result!)
                
                print("\(json[0].userID)")

                print("\(json[0].productID)")
                
                
           
                
            }catch{
                print(error)
            }
        }
    
}

func addtoup3() {
    
    let pid : Int

    
    AF.request("http://localhost:8000/api/storeowners" , method: .post, parameters:[
        "uid" : UserDefaults.standard.value(forKey: "id") as! Int,
        "pid" :  UserDefaults.standard.value(forKey: "repoid") as! Int
    
    ]).responseJSON {(response) in
        
        

    }
}




struct Spinner3: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `ifs3`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

