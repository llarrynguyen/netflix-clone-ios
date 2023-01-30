//
//  MovieDetail.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker: Bool = false
    @State private var selectedSeason = 1
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        movieDetailToShow = nil
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    }
                }
                .padding(.horizontal, 22)
 
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 12){
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2, height: 300)
                        MovieInfoSubheadline(movie: movie)
                        if let promo = movie.promotionHeadline {
                            Text(promo)
                                .bold()
                                .font(.headline)
                        }
                        PlayButton(image: "play", text: "Play", backgroundColor: .red) {
                            // todo
                        }
                        CurrentEpisodeInformation(movie: movie)
                        CastInfo(movie: movie)
                        
                        HStack(spacing: 60) {
                            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                //todo
                            }
                            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: false) {
                                //todo
                            }
                            SmallVerticalButton(text: "My List", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                //todo
                            }
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        CustomTabSwitcher(
                            tabs: [.episodes, .trailers, .more],
                            movie: movie,
                            showSeasonPicker: $showSeasonPicker,
                            selectedSeason: $selectedSeason
                        )
                    }
                    .padding(.horizontal, 10)
                }
                Spacer()
            }
            .foregroundColor(.white)
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.9)
                    VStack(spacing: 40) {
                        Spacer()
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button {
                                self.selectedSeason =  season + 1
                                self.showSeasonPicker = false
                            } label: {
                                Text("Season \(season + 1)")
                                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                    .bold()
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                            }
                            
                        }
                        Spacer()
                        Button {
                            self.showSeasonPicker = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
                        }
                        .padding(.bottom, 30)
                    }
                }
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie1, movieDetailToShow: .constant(nil))
    }
}

enum CustomTab: String {
    
    case episodes = "EPISODES"
    case trailers = "TRAILERS AND MORE"
    case more = "MORE LIKE THIS"
}

struct MovieInfoSubheadline: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            RatingView(rating: movie.rating)
            Text(movie.numberOfSeasonsDisplay)
            HDButton()
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct HDButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .border(Color.gray.opacity(0.5), width: 3)
                .cornerRadius(4)
            Text("HD")
                .padding(5)
                .font(.system(size: 12))
        }
        .frame(width: 40, height: 26)
        .padding(.leading, 4)
    }
}

struct CurrentEpisodeInformation: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct CastInfo: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text(movie.creators)
                Spacer()
            }
            HStack {
                Text(movie.cast)
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 3)
    }
}


