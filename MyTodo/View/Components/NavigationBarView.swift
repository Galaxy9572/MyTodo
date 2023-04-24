//
//  NavigationBarView.swift
//  MyTodo
//
//  Created by 廖俊瑶 on 2023/4/17.
//

import SwiftUI

struct NavigationBarView: View {
    
    var navigationTitle = "Title"
    
    static let navigationHeight: CGFloat = 70.0
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            HStack {
//                Image("AppIcon").foregroundStyle(.linearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)).font(.largeTitle)
//                    .padding()
                Image("img1")
                    .resizable()
                    .scaledToFit()
                    .font(.largeTitle)
                    .padding(.leading)
                    .blendMode(.plusDarker)
                Text(navigationTitle)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.rotationEffect(.degrees(360))
        }.frame(height: NavigationBarView.navigationHeight)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
