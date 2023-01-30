//
//  HomeViewModel.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    //String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map({ String($0) })
    }

    public var allGenres: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Thriller, .Horror, .Anime]

    public func getMovies(
        for category: String,
        with row: HomeTopRow,
        andGenre genre: HomeGenre
    ) -> [Movie] {

        switch row {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter( {$0.movieType == .tvShow && $0.genre == genre} )
        case .movies:
            return (movies[category] ?? []).filter( {$0.movieType == .movie && $0.genre == genre} )
        case .myList:
            return movies[category] ?? []
        }
    }

    init() {
        setupMovies()
    }
    
    func setupMovies() {

        movies["Trending Now"] = exampleMovies
        movies["Comedy"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Horror"] = exampleMovies.shuffled()
        movies["Trillers"] = exampleMovies.shuffled()
        movies["Drama"] = exampleMovies.shuffled()
    }
}
