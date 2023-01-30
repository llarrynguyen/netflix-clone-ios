//
//  VideoPreviewImage.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
    
    var imageURL: URL
    var videoURL: URL
    
    @State private var showingVideoPlayer: Bool = false

    var body: some View {
        ZStack {
            KFImage(imageURL)
                .resizable()
            Button {
                showingVideoPlayer = true
            } label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            }
            .sheet(isPresented: $showingVideoPlayer) {
                SwiftUIVideoView(url: videoURL)
            }
        }
    }
}

struct VideoPreviewImage_Previews: PreviewProvider {
    static var previews: some View {
        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
    }
}
