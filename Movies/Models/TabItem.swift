//
//  TabItem.swift
//  Movies
//
//  Created by Cristopher Escorcia on 16/01/22.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let icon: String
    let tab: Tab
}

enum Tab: String {
    case home
    case search
    case profile
}

let tabItems = [
    TabItem(icon: "house", tab: .home),
    TabItem(icon: "magnifyingglass", tab: .search),
    TabItem(icon: "person", tab: .profile)
]
