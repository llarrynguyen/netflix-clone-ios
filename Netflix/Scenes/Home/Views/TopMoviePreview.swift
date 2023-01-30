//
//  TopMoviePreview.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {

    var movie: Movie

    func isCategoryLast(_ category: String) -> Bool {

        let catCount = movie.categories.count // 4
        if let index = movie.categories.firstIndex(of: category) {
            if index + 1 != catCount {
                return false
            }
        }
        return true
    }

    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            VStack {
                Spacer()
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack {
                    Spacer()

                    SmallVerticalButton(
                        text: "My List",
                        isOnImage: "checkmark",
                        isOffImage: "plus",
                        isOn: true
                    ) {
                        print("Tapped")
                    }

                    Spacer()

                    PlayButton(image: "play", text: "Play") {
                        print("play")
                    }
                    .frame(width: 120)

                    Spacer()

                    SmallVerticalButton(
                        text: "Info",
                        isOnImage: "info.circle",
                        isOffImage: "info",
                        isOn: true
                    ) {
                        print("Tapped")
                    }

                    Spacer()
                }
            }
            .background(
                CustomGradient(
                    colors: [
                        Color.black.opacity(0),
                        Color.black.opacity(1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom,
                    paddingEdges: .top,
                    padding: 300
                )
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
