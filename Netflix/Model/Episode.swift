//
//  Episode.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import Foundation

struct Episode: Identifiable {

    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var episodeNumber: Int
    var thumbnailImageUrlString: String
    var description: String
    var length: Int
    var videoURL: URL
    var thumnailURL: URL {
        return URL(string: thumbnailImageUrlString)!
    }
}
