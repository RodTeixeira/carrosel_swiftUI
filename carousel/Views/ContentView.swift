//
//  ContentView.swift
//  carousel
//
//  Created by Rodolfo on 26/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModelMuvies()
    var body: some View {
        NavigationView {
            ScrollView {
                Carousel(categoryName: "Melhores Filmes")
            }.navigationBarTitle("Filmes", displayMode: .large)
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModelMuvies())
    }
}
