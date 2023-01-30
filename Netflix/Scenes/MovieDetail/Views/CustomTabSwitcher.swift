//
//  CustomTabSwitcher.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes

    var tabs: [CustomTab]
    var movie: Movie

    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int

    func widthForTab(_ tab: CustomTab) -> CGFloat {

        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }

    var body: some View {
        VStack {
            // Custom tab Picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            // red bar
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                                
                            Button {
                                currentTab = tab
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab), height: 30)
                        }
                    }
                }
            }
            
            switch currentTab {
            case .episodes:
                EpisodesView(
                    episodes: movie.episodes ?? [],
                    showSeasonPicker: $showSeasonPicker,
                    selectedSeason: $selectedSeason
                )
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
