//
//  ItemsListView.swift
//  Redux-example-ios
//

import SwiftUI

struct MenuItemsListView: View {
    var items: [Item]
    
    var body: some View {
        List(items) { item in
            Text(item.title)
        }
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsListView(items: Item.fakeItems())
    }
}

