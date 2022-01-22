//
//  MoviesPosterImage.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import SwiftUI

struct MoviesPosterImage: View {
    var posterPath: String
    
    var body: some View {
        AsyncImage(url: URL(
            string: "\(Constants.URLs.baseImageURL)"+"\(posterPath)"
        )) { phase in
            switch phase {
                
            case .empty:
                ZStack {
                    Color.gray.opacity(0.5)
                }
                .cornerRadius(10.0)
                .frame(width: 220, height: 300)
                .redacted(reason: .placeholder)
                .padding(.horizontal)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10.0)
                    .frame(width: 220, height: 300)
                    .animation(.spring(response: 0.900, dampingFraction: 0.825, blendDuration: 0.0))
                    .transition(.move(edge: .trailing))
                
            case .failure:
                ZStack {
                    Color.gray.opacity(0.5)
                }
                .cornerRadius(10.0)
                .frame(width: 220, height: 300)
                .redacted(reason: .placeholder)
                .padding(.horizontal)
                
            default:
                ZStack {
                    Color.gray.opacity(0.5)
                }
                .cornerRadius(10.0)
                .frame(width: 220, height: 300)
                .redacted(reason: .placeholder)
                .padding(.horizontal)
            }
        }
    }
}
