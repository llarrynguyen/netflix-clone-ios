//
//  MoreLikeThis.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct MoreLikeThis: View {
    
    let movies: [Movie]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<movies.count) { index in
                    StandardHomeMovie(movie: movies[index])
                }
            }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movies: [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6])
    }
}
