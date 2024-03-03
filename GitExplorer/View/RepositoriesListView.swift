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
                            VStack(alignment: .center) {
                                AsyncImage(url: URL(string: repos.owner?.avatarUrl ?? ""), scale: 2)
                                Text("\(repos.owner?.login ?? "") / \(repos.name ?? "")")
                                Text(repos.language ?? "")
                                
                                VStack {
                                    HStack {
                                        Text("Forks")
                                        Spacer()
                                        Text(String(repos.forksCount ?? 0))
                                    }
                                    
                                    HStack {
                                        Text("Issues")
                                        Spacer()
                                        Text(String(repos.openIssuesCount ?? 0))
                                    }
                                    
                                    HStack {
                                        Text("Stared by")
                                        Spacer()
                                        Text(String(repos.stargazersCount ?? 0))
                                    }
                                    
                                    HStack {
                                        Text("Last release version")
                                        Spacer()
                                        Text("327")
                                    }
//                                    Text(repos.releasesUrl ?? "")
                                }
                                .padding(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.gray, lineWidth: 0.5)
                                )
                                .padding(20)
                                                                
                                Spacer()
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
