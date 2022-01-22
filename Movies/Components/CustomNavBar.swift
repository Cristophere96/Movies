//
//  CustomNavBar.swift
//  Movies
//
//  Created by Cristopher Escorcia on 21/01/22.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person")
                .renderingMode(.original)
                .foregroundColor(Color.primary)
                .font(.system(size: 16, weight: .light))
                .frame(width: 50, height: 50)
                .background(.ultraThinMaterial, in: Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Hello,")
                    .font(.body)
                    .fontWeight(.regular)
                
                Text("Timur K.")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
    }
}
