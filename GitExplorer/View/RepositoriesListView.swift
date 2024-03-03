import SwiftUI

struct RepositoriesListView: View {
    @ObservedObject var viewModel = RepositoriesListViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                if case viewModel.repositoriesArray = viewModel.repositoriesArray {
                    HStack {
                        Text("\(viewModel.repositoriesCount) result")
                        Spacer()
                    }.padding(20)
                    
                    List(viewModel.repositoriesArray) { repos in
                        NavigationLink {
                            VStack(alignment: .leading) {
                                Text(repos.name ?? "")
                            }
                            
                        } label: {
                            ReposRow(repos: repos).padding(0)
                        }
                    }
                    
                } else {
                    EmptyListView()
                }
            }
            .navigationTitle("Repository library")
            .searchable(text: $viewModel.searchText)
        }
    }
}

struct ReposRow: View {
    let repos: Repository
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: repos.owner?.avatarUrl ?? ""), scale: 8)
                           
                VStack(alignment: .leading) {
                    Text("\(repos.owner?.login ?? "") / \(repos.name ?? "")")
                    Text(repos.description ?? "").lineLimit(1)
                }
            }
        }.padding(0)
    }
}

struct EmptyListView: View {
    var body: some View {
        VStack {
            Image("alittleempty")
        }
    }
}

#Preview {
    RepositoriesListView()
}
