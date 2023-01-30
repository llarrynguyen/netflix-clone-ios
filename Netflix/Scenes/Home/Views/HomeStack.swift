//
//  HomeStack.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct HomeStack: View {

    var viewModel = HomeViewModel()
    @Binding var movieDetailToShow: Movie?
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre

    var body: some View {
        ForEach(viewModel.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.getMovies(for: category, with: topRowSelection, andGenre: selectedGenre)) { movie in
                            VStack {
                                StandardHomeMovie(movie: movie)
                                    .frame(width: 100, height: 200)
                                    .padding(.horizontal, 20)
                                    .onTapGesture {
                                        movieDetailToShow = movie
                                    }
                            }
                        }
                    } 
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(movieDetailToShow: .constant(nil), topRowSelection: .home, selectedGenre: .AllGenres)
            }
        }
        .foregroundColor(.white)
    }
}
