import SwiftUI

class RepositoriesListViewModel: ObservableObject {
    
    @Published var repositoriesArray = [Repository]()
    @Published var repositoriesCount = 0
    @Published var searchText: String = ""
    
    init() {

        loadRepositories()
    }
    
    func loadRepositories() {
        let rootData = Bundle.main.decode(Root.self, from: "RepositoriesData.json")
        
        repositoriesArray = rootData.items?.compactMap { $0 } ?? []
        repositoriesCount = repositoriesArray.count
    }
}
