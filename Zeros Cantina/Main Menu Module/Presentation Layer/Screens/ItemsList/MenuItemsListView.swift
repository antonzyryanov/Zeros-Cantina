//
//  ItemsListView.swift
//  Redux-example-ios
//

import SwiftUI

struct MenuItemsListView: View {
    var items: [MenuItem]
    
    var itemAction: ((MenuItem)->Void)
    
    var body: some View {
        ZStack {
            Image("stars_background").frame(width: UIScreen.main.bounds.width-36, height: UIScreen.main.bounds.height,alignment: .center)
            VStack {
                ForEach(items.indices, id:\.self) { index in
                    Text(items[index].title ?? "")
                        .font(.system(size: 36))
                        .foregroundColor(.init(red: 218/255, green: 200/255, blue: 73/255))
                        .fontWeight(.bold)
                        .onTapGesture {
                            itemAction(items[index])
                        }
                }
            }
        }
        
    }
    
}
