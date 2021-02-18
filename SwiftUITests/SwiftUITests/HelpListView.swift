//
//  HelpListView.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 21.12.2020.
//

import SwiftUI

struct HelpListView: View {
    enum RowType: Hashable {
        case title
        case content(String)
    }
    
    var items: [RowType] = [
        .title,
        .content("How to Play"),
        .content("Terms Of Use"),
        .content("Privacy Policy"),
        .content("Subscription Terms"),
        .content("Contact Us")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            List(items, id: \.self) { (rowType) in
                switch rowType {
                case .title:
                    GeometryReader {
                        Text("123")
                            .frame(width: $0.size.width, height: $0.size.height)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.orange)
                            )
                    }
                case .content(let title):
                    Text(title)
                }
            }
        }
        .background(Color.orange)
    }
}

struct HelpListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HelpListView()
        }
    }
}
