//
//  CustomTabBar.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Button {
                    withAnimation(.spring(response: 0.550, dampingFraction: 0.825, blendDuration: 0.0)) {
                        selectedTab = item.tab
                    }
                } label: {
                    VStack {
                        Image(systemName: item.icon)
                            .symbolVariant(.none)
                            .font(.system(size: 24, weight: .light))
                            .frame(width: 44, height: 29)
                    }
                    .frame(maxWidth: .infinity)
                }
                .foregroundColor(selectedTab == item.tab ? Color.purple : .secondary)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 14)
        .frame(height: 60, alignment: .center)
        .background(Color.purple.opacity(0.1))
        .background(.ultraThinMaterial)
        .customCorners(5, corners: [.topLeft, .topRight])
        .customCorners(24, corners: [.bottomLeft, .bottomRight])
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

extension View {
    func customCorners(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
