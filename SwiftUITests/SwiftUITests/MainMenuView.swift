//
//  MainMenuView.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 14.02.2021.
//

import SwiftUI

struct MainMenuView: View {
    var items: [Item] = [
        Item(id: 1, title: "Animated Circle"),
        Item(id: 2, title: "Help View"),
        Item(id: 3, title: "Autostart"),
        Item(id: 4, title: "Dynamic View"),
        Item(id: 5, title: "Circle Dragging")
    ]
    
    var body: some View {
        NavigationView {
            List(items) { item in
                if item.id == 1 {
                    NavigationLink(destination: AnimatedCircleView()
                                    .navigationViewStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Navigation View Style@*/DefaultNavigationViewStyle()/*@END_MENU_TOKEN@*/)) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.orange)
                            .frame(maxWidth: 100)
                        
                        Text("\(item.title)")
                    }
                } else if item.id == 2 {
                    NavigationLink(destination: HelpListView()) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.orange)
                            .frame(maxWidth: 100)
                        
                        Text("\(item.title)")
                    }
                } else if item.id == 3 {
                    NavigationLink(destination: AutoStartView()) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.orange)
                            .frame(maxWidth: 100)
                        
                        Text("\(item.title)")
                    }
                } else if item.id == 4 {
                    NavigationLink(destination: DynamicAddableContentView()) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.orange)
                            .frame(maxWidth: 100)
                        
                        Text("\(item.title)")
                    }
                } else if item.id == 5 {
                    NavigationLink(destination: CircleDragging()) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.orange)
                            .frame(maxWidth: 100)
                        
                        Text("\(item.title)")
                    }
                }
            }.navigationTitle("Main Menu")
        }
    }
}

extension MainMenuView {
    struct Item: Identifiable {
        let id: Int
        let title: String
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
