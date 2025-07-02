//
//  ItemsListContainerView.swift
//  Redux-example-ios
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: Store<AppState, AppMenuAction>
    
    var body: some View {
        MenuItemsListView(items: store.state.items)
            .onAppear(perform: loadItems)
    }
}

// MARK: - Actions
private extension HomeView {
    
    func loadItems() {
        store.send(.items(action: .loadItems))
    }
}

struct ItemsListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
