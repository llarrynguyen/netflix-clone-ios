//
//  SearchBar.swift
//  Netflix
//
//  Created by Larry Nguyen on 10/13/23.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var text: String = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
        }
        .background(Color.white)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            SearchBar()
        }
    }
}
