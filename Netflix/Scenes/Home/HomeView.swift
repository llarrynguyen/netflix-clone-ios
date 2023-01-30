//
//  HomeView.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct HomeView: View {

    var viewModel = HomeViewModel()
    var screen = UIScreen.main.bounds

    @State private var movieDetailToShow: Movie?
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = . AllGenres
    @State private var showGenreSelection: Bool = false
    @State private var showTopRowSelection: Bool = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    TopRowButtons(
                        topRowSelection: $topRowSelection,
                        homeGenre: $homeGenre,
                        showGenreSelection: $showGenreSelection,
                        showTopRowSelection: $showTopRowSelection
                    )
                    TopMoviePreview(movie: exampleMovie3)
                        .frame(width: screen.width)
                        .padding(.top, -150)
                        .zIndex(-1.0)
                    HomeStack(
                        viewModel: viewModel,
                        movieDetailToShow: $movieDetailToShow,
                        topRowSelection: topRowSelection,
                        selectedGenre: homeGenre
                    )
                }
            }
            if let movie = movieDetailToShow {
                MovieDetail(movie: movie, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40) {
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            Button {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            } label: {
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .bold()
                                }
                                else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            }

                        }
                        Spacer()
                        Button {
                            showTopRowSelection = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 50))
                        }
                        .padding(.bottom, 50)

                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40) {
                        Spacer()
                        ForEach(viewModel.allGenres, id: \.self) { genre in
                            Button {
                                homeGenre = genre
                                showGenreSelection = false
                            } label: {
                                if genre == homeGenre {
                                    Text("\(genre.rawValue)")
                                        .bold()
                                }
                                else {
                                    Text("\(genre.rawValue)")
                                        .foregroundColor(.gray)
                                }
                            }

                        }
                        Spacer()
                        Button {
                            showGenreSelection = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 50))
                        }
                        .padding(.bottom, 50)

                    }
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool

    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()
                Button {
                    topRowSelection = .tvShows
                } label: {
                    Text("TV Shows")
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button {
                    topRowSelection = .movies
                } label: {
                    Text("Movies")
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                Button {
                    topRowSelection = .myList
                } label: {
                    Text("My List")
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .tvShows:
            HStack {
                Button {
                    topRowSelection = .home
                } label: {
                    Image("netflix_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .buttonStyle(PlainButtonStyle())

                HStack(spacing: 20) {
                    Button {
                        showTopRowSelection = true
                    } label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button {
                        showGenreSelection = true
                    } label: {
                        Text(homeGenre.rawValue)
                            .font(.system(size: 12))
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 6))
                            .rotationEffect(.degrees(180), anchor: .center)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()
                }
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        case .movies:
            Text("Test")
        case .myList:
            Text("Test")
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}


enum HomeGenre: String, CaseIterable {
    case AllGenres = "All Genres"
    case Action
    case Comedy
    case Thriller
    case Horror
    case Anime
}


