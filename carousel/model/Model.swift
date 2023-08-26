//
//  Model.swift
//  carousel
//
//  Created by Rodolfo on 26/08/23.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var likes: Int = 0
}
