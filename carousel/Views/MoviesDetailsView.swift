//
//  MoviesDetailsView.swift
//  carousel
//
//  Created by Rodolfo on 26/08/23.
//

import SwiftUI

struct MovieDetailsView: View {
     
    let movie: Movie
     
    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFit()
            .navigationTitle(movie.title)
    }
}
 
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(title: "Vingadores", imageName: "img_avangers"))
    }
}
