//
//  Section.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import SwiftUI

struct Section<Content: View>: View{
    var title: String
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding([.horizontal, .top])
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color("mainColor"))
                    .frame(width: 50, height: 5)
                    .padding([.horizontal, .bottom])
                
                content
            }
        }
    }
}
