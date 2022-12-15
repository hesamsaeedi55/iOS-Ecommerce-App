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



@available(iOS 15.0, *)
public struct search: View {
    @State var change = false
    @State var text: String = "abr"
    public init() {}
    @State var start = true
    public var body: some View {
        
        NavigationView {
        VStack(spacing: 25) {
            Spacer()
        
            RepositoriesListContainer2(viewModel: RepositoriesViewModel2(catStyle: text))
            
        Text(text)
                
                .background(Color.gray)
                
                
        TextField("ClearButton", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .modifier(ClearButton(text: $text))
            .onChange(of: text,perform:{ newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                  
                

                }
            })
              
            
            
            Spacer()
            }
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
                        .foregroundColor(Color.gray)
                }
                .buttonStyle(PlainButtonStyle())
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding()
        .animation(.easeOut(duration: 0.3), value: text)
    }
}

@available(iOS 15.0, *)
struct search_Previews: PreviewProvider {
    static var previews: some View {
        search()
    }
}


class GithubAPI2 {
    
    static let pageSize = 1
    
    static func searchRepos(page: Int,text: String) -> AnyPublisher<[Repository], Error> {
        let url = URL(string:
//                        "http://localhost:8000/api/showpro/\(cat)/5?page=\(page)")!
                      "http://localhost:8000/api/products/search/\(text)/4")!
        print(page)
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!) })
            .tryMap { try JSONDecoder().decode(GithubSearchResult<Repository>.self, from: $0.data).data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct GithubSearchResult2<T: Codable>: Codable {
    let data: [T]
}

struct Repository2: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let slug: String
    let description: String?
    let price: String
    let entity: Int
}



//var num = 0
// var catStyle: Int!

class RepositoriesViewModel2: ObservableObject {
    
    var catStyle : String
    init(catStyle:String) {
        self.catStyle = catStyle
        print(catStyle)
//        num = catStyle
    }
    
    @Published private(set) var state = State()
    private var subscriptions = Set<AnyCancellable>()
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage else { return }
        GithubAPI2.searchRepos(page: state.page,text: catStyle )
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
    
    
    

    private func onReceive(_ batch: [Repository]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = (batch.count != 0)
    }
    
    
    

    struct State {
        var repos: [Repository] = []
        var page: Int = 1
        var canLoadNextPage = true

    }
}


var sampleuser22 : sampleUser!




@available(iOS 15.0, *)
struct RepositoriesListContainer2: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: RepositoriesViewModel2
    
    var body: some View {
        Button("Dismiss") {
                   presentationMode.wrappedValue.dismiss()
               }
        
        RepositoriesList2(
            repos: viewModel.state.repos,
            isLoading: viewModel.state.canLoadNextPage,
            onScrolledAtBottom: viewModel.fetchNextPageIfPossible
            
        )

        .onAppear(perform: viewModel.fetchNextPageIfPossible)
        
    }

}



//MARK: MAIN REPOSITORYLIST

@available(iOS 15.0, *)
struct RepositoriesList2: View {
    let repos: [Repository]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {


                   
        VStack {
//            Button("refresh") {
//                self.onScrolledAtBottom()
//
//            }
            
            reposList
               
//            if isLoading {
//                loadingIndicator
//            }
     
        }
       
    }
        
    
//    let repo: Repository

    private var reposList: some View {
        
//        ForEach(repos) { repo in/
            ScrollView(.vertical,content :{
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],
                      alignment: .center,
                      spacing:50,
                      content: {
                            ForEach(repos) { repo in
                                RepositoryRow(repo: repo).onAppear{
                                    if self.repos.last == repo {
                                        self.onScrolledAtBottom()
                                    }
                                }
                            .onTapGesture {
                            }
                        .frame(height:240)
                           }
                      })}
            
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
struct RepositoryRow2: View {
    let repo: Repository
    
    var body: some View {
        
        
        ProductsSquare(product: repo, blur: false, name: repo.name, imageLink: "1")
            .onTapGesture {
                print(repo.id
                )
            }
//            .ifs(repo.entity == 0, transform: { view in
//                view.background(Color.red)
//            }
//            
//            )
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
//        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}



struct thisData2 : Decodable {
    let name : String
}




//MARK: TAPPED URL

func tappedUrl2(_ id: Int) {
    

    AF.request("http://localhost:8000/api/kharidremove/\(id)" , method: .post).responseJSON {(response) in
        
        let result = response.data

        do {
            
            let json = try JSONDecoder().decode([thisData].self,from:result!)
            addtoup()
            
            
            
        }catch{
            print(error)
        }
    }
}

func addtoup2() {
    let pid : Int

    
    AF.request("http://localhost:8000/api/storeowners" , method: .post, parameters:[
        "uid" : UserDefaults.standard.value(forKey: "id") as! Int,
        "pid" :  UserDefaults.standard.value(forKey: "repoid") as! Int
    
    ]).responseJSON {(response) in
        
        

    }
}




struct Spinner2: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}


//extension View {
//    /// Applies the given transform if the given condition evaluates to `true`.
//    /// - Parameters:
//    ///   - condition: The condition to evaluate.
//    ///   - transform: The transform to apply to the source `View`.
//    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
//    @ViewBuilder func `ifs2`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
//        if condition {
//            transform(self)
//        } else {
//            self
//        }
//    }
//}
