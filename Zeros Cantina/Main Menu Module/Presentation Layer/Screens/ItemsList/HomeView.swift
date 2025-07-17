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
                .onAppear(perform: sendInitialActions).padding(18)
            VStack {
                HStack {
                    ZStack {
                        Image(store.state.isMusicOn ? "sound_on_icon" : "sound_off_icon")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32,height: 32)
                            .foregroundColor(.yellow)
                        .onTapGesture {
                            store.send(.common(action: .set(isMusicOn: !store.state.isMusicOn)))
                        }
                        
                    }.frame(width: 64,height: 64)
                        .padding(.leading, 12)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width,height: 64).fixedSize(horizontal: true, vertical: false)
                    .padding(.top, 20)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height).fixedSize(horizontal: false, vertical: true)
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
    
    func sendInitialActions() {
        if store.state.areInitialActionsPerformed { return }
        store.send(.items(action: .setupItems))
        store.send(.common(action: .set(isMusicOn: true)))
        store.send(.common(action: .setInitialActionsDone))
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
