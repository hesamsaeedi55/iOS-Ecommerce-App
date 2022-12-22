//
//
//  RepositoriesList.swift
//  he
//
//  Created by Hesamoddin on 10/29/21.
//  Copyright © 2020 Hesamoddin. All rights reserved.
//

import SwiftUI
import Combine

class RepositoriesViewModel1: ObservableObject {
    
   
    @Published private(set) var state = State()
    private var subscriptions = Set<AnyCancellable>()
    
    
    func fetchNextPageIfPossible() {
        guard state.canLoadNextPage else { return }
        
        GithubAPI.searchRepos(page: state.page)
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

    private func onReceive(_ batch: [Repository1]) {
        state.repos += batch
        state.page += 1
        state.canLoadNextPage = (batch.count != 0) 
    }

    struct State {
        var repos: [Repository1] = []
        var page: Int = 1
        var canLoadNextPage = true
    }
}

struct RepositoriesListContainer: View {

    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        RepositoriesList(
            repos: viewModel.state.repos,
            isLoading: viewModel.state.canLoadNextPage,
            onScrolledAtBottom: viewModel.fetchNextPageIfPossible
        )
        .onAppear(perform: viewModel.fetchNextPageIfPossible)
    }
}

struct RepositoriesList: View {
    
    @State var showingSheet : Bool = false

    let repos: [Repository1]
    let isLoading: Bool
    let onScrolledAtBottom: () -> Void
    
    var body: some View {
        NavigationView {
        VStack {
            HStack {
            
                NavigationLink(destination: newDesign()) {
                    Text("New View")
                }
                
                
            if #available(iOS 14.0, *) {
                Button("refresh") {
                    
                    showingSheet.toggle()
                    
                }.fullScreenCover(isPresented: $showingSheet) {
                    newDesign()
                }
            } else {
                // Fallback on earlier versions
            }
            }
            
        List {
            reposList
            if isLoading {
                loadingIndicator
            }
            }
        }
        .navigationBarHidden(true)
        }
    }
    
    private var reposList: some View {
        ForEach(repos) { repo in
            RepositoryRow(repo: repo).onAppear {
                if self.repos.last == repo {
                    self.onScrolledAtBottom()
                }
            }
        }
    }
    
    private var loadingIndicator: some View {
        Spinner(style: .medium)
            .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
        
    }
}

struct RepositoryRow: View {
    let repo: Repository1
    
    var body: some View {
        VStack {
            Text(repo.name).font(.title)
            repo.description.map(Text.init)?.font(.body)
        }
        .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
    }
}
