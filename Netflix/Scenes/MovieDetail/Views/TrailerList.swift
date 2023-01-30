//
//  TralierList.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct TrailerList: View {
    
    let trailers: [Trailer]
    
    let screen = UIScreen.main.bounds

    var body: some View {
        VStack() {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)
                    Text(trailer.name)
                        .font(.headline)
                }
                .frame(height: 250)
            }
        }
        .foregroundColor(.white)
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            TrailerList(trailers: exampleTrailers)
        }
    }
}
