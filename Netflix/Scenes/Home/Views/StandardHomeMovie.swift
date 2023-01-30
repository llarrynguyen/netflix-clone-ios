//
//  StandardHomeMovie.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {

    var movie: Movie

    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
