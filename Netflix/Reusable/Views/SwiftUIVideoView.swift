//
//  SwiftUIVideoView.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {

    let url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
 
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoView(url: exampleVideoURL)
    }
}
