//
//  SearchViewModel.swift
//  InstagramSwiftUITutorial
//
//  Created by Carlo Falchi on 13/04/21.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot, _) in
            
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({try? $0.data(as: User.self)})
            
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        
        let loweredcasedQuery = query.lowercased();
        
        return users.filter({ $0.fullname.lowercased().contains(loweredcasedQuery) || $0.username.lowercased().contains(loweredcasedQuery) })
    }
}
