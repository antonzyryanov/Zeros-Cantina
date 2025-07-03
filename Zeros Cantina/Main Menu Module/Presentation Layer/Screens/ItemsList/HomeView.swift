//
//  ItemsListContainerView.swift
//  Redux-example-ios
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: MenuStore<AppState, AppMenuAction>
    
    var body: some View {
        ZStack {
            Color.purple
            MenuItemsListView(items: store.state.items, itemAction: open(item:))
                .onAppear(perform: loadItems).padding(18)
        }
        .onReceive(store.$state) { output in
            if let chosenItem = output.chosenItem {
                store.menuRouter?.navigateTo(screen: chosenItem)
                store.send(.items(action: .itemWasOpened))
            }
        }
        
    }
    
    
}

// MARK: - Actions
private extension HomeView {
    
    func loadItems() {
        store.send(.items(action: .setupItems))
    }
    
    func open(item: MenuItem) {
        store.send(.items(action: .openItem(item)))
    }
    
}

struct ItemsListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
