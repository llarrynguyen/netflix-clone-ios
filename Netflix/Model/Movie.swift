//
//  Movie.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import Foundation

struct Movie: Identifiable {

    var id: String
    var name: String
    var thumbnailURL: URL?
    var categories: [String]
    var genre: HomeGenre = .AllGenres

    // MovieDetailView

    var year: Int
    var rating: String
    var numberOfSeasons: Int?

    var promotionHeadline: String?

    var trailers: [Trailer]

    // Personalization
    var currentEpisode: CurrentEpisodeInfo?

    // if user has not started an episode, we have to show something default
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String

    var moreLikeThisMovies: [Movie]

    var episodes: [Episode]?

    var movieType: MovieType {
        return episodes != nil ? .tvShow : .movie
    }

    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "\(num) season"
            } else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {

    case movie
    case tvShow
}
