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
                .frame(width: 200, height: 280)
                .redacted(reason: .placeholder)
                .padding(.horizontal)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10.0)
                    .frame(width: 200, height: 280)
                
            case .failure:
                ZStack {
                    Color.gray.opacity(0.5)
                }
                .cornerRadius(10.0)
                .frame(width: 200, height: 280)
                .redacted(reason: .placeholder)
                .padding(.horizontal)
                
            default:
                ZStack {
                    Color.gray.opacity(0.5)
                }
                .cornerRadius(10.0)
                .frame(width: 200, height: 280)
                .redacted(reason: .placeholder)
                .padding(.horizontal)
            }
        }
    }
}
