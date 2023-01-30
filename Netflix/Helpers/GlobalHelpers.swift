//
//  GlobalHelpers.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(
    name: "Season 3 Trailer",
    videoURL: exampleVideoURL,
    thumbnailImageURL: randomExampleImageURL
)

let exampleTrailer2 = Trailer(
    name: "The Hero's journey",
    videoURL: exampleVideoURL,
    thumbnailImageURL: randomExampleImageURL
)

let exampleTrailer3 = Trailer(
    name: "The Mysterious",
    videoURL: exampleVideoURL,
    thumbnailImageURL: randomExampleImageURL
)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/300"),
    categories: ["Suspensful", "Triller", "Drama"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 2,
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6],
    episodes: exampleEpisodes
    
)

let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Stranger Things",
    thumbnailURL: URL(string: "https://picsum.photos/200/301"),
    categories: ["Triller", "Suspensful"],
    year: 2018,
    rating: "TV-MA",
    numberOfSeasons: 2,
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    episodes: exampleEpisodes
)

let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Squid Game",
    thumbnailURL: URL(string: "https://picsum.photos/200/302"),
    categories:  ["Triller", "Suspensful", "Distopian", "Foreign"],
    year: 2021,
    rating: "TV-MA",
    numberOfSeasons: 3,
    promotionHeadline: "Best rated show on Netflix",
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: []
)

let exampleMovie4 = Movie(
    id: UUID().uuidString,
    name: "Money Heist",
    thumbnailURL: URL(string: "https://picsum.photos/200/303"),
    categories: ["Triller", "Suspensful", "Drama"],
    year: 2019,
    rating: "TV-MA",
    numberOfSeasons: 4,
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: []
)


let exampleMovie5 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnailURL: URL(string: "https://picsum.photos/200/304"),
    categories: ["Suspensful", "Triller", "Drama"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: 1,
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: []
    
)

let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "Stranger Things",
    thumbnailURL: URL(string: "https://picsum.photos/200/305"),
    categories: ["Triller", "Suspensful"],
    year: 2018,
    rating: "TV-MA",
    numberOfSeasons: 2,
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: []
)

let exampleMovie7 = Movie(
    id: UUID().uuidString,
    name: "Squid Game",
    thumbnailURL: URL(string: "https://picsum.photos/200/306"),
    categories:  ["Triller", "Suspensful", "Distopian", "Foreign"],
    year: 2021,
    rating: "TV-MA",
    numberOfSeasons: 3,
    promotionHeadline: "Best rated show on Netflix",
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: []
)

let exampleMovie8 = Movie(
    id: UUID().uuidString,
    name: "Money Heist",
    thumbnailURL: URL(string: "https://picsum.photos/200/307"),
    categories: ["Triller", "Suspensful", "Drama"],
    year: 2019,
    rating: "TV-MA",
    numberOfSeasons: 4,
    trailers: exampleTrailers,
    defaultEpisodeInfo: exampleInfo1,
    creators: "Baran bo Odan, Jantje Friese",
    cast: "Louis Hoffmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: []
)

let exampleInfo1 = CurrentEpisodeInfo(
    episodeName: "Beginnings and Endings",
    description: "Six months after the disappearances, the police from a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
    season: 2,
    episode: 1
)

let episode1 = Episode(
    name: "Beginnings and Endings",
    season: 1,
    episodeNumber: 1,
    thumbnailImageUrlString: "https://picsum.photos/200/304",
    description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean",
    length: 53,
    videoURL: exampleVideoURL
)

let episode2 = Episode(
    name: "Beginnings and Endings",
    season: 1,
    episodeNumber: 2,
    thumbnailImageUrlString: "https://picsum.photos/200/305",
    description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean",
    length: 53,
    videoURL: exampleVideoURL
)

let episode3 = Episode(
    name: "Beginnings and Endings",
    season: 1,
    episodeNumber: 3,
    thumbnailImageUrlString: "https://picsum.photos/200/306",
    description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean",
    length: 53,
    videoURL: exampleVideoURL
)

let episode4 = Episode(
    name: "Beginnings and Endings",
    season: 2,
    episodeNumber: 1,
    thumbnailImageUrlString: "https://picsum.photos/200/307",
    description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean",
    length: 53,
    videoURL: exampleVideoURL
)

let episode5 = Episode(
    name: "Beginnings and Endings",
    season: 2,
    episodeNumber: 2,
    thumbnailImageUrlString: "https://picsum.photos/200/308",
    description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean",
    length: 53,
    videoURL: exampleVideoURL
)

let episode6 = Episode(
    name: "Beginnings and Endings",
    season: 2,
    episodeNumber: 3,
    thumbnailImageUrlString: "https://picsum.photos/200/303",
    description: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean",
    length: 53,
    videoURL: exampleVideoURL
)

var exampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]
let exampleMovies = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6, exampleMovie7, exampleMovie8]


extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {

        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
