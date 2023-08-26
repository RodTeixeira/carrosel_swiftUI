//
//  viewModel.swift
//  carousel
//
//  Created by Rodolfo on 26/08/23.
//

import Foundation

class ViewModelMuvies: ObservableObject {
    
    lazy var movies = [
        Movie(title: "Vingadores", imageName: "img_avangers", likes: 4),
        Movie(title: "Avatar", imageName: "img_avatar", likes: 4),
        Movie(title: "Harry potter", imageName: "img_harry", likes: 5),
        Movie(title: "Homen aranha", imageName: "img_spider", likes: 3),
        Movie(title: "Legião", imageName: "img_legion", likes: 2)
    ]
}
