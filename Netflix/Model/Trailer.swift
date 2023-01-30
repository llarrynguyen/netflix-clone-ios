//
//  Trailer.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import Foundation

struct Trailer: Identifiable {
    

    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
