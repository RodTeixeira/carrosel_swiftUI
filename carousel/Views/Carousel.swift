//
//  Carousel.swift
//  carousel
//
//  Created by Rodolfo on 26/08/23.
//

import Foundation
import SwiftUI

struct Carousel: View {
     
    @EnvironmentObject var vm: ViewModelMuvies
    @Environment(\.colorScheme) var colorScheme
    let categoryName: String
     
    var body: some View {
        VStack {
            HStack {
                Text(categoryName)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(2)
                Spacer()
            }.padding(.horizontal)
            .padding(.top)
             
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(vm.movies) { value in
                        GeometryReader { proxy in
                            let scale = getScale(proxy: proxy)
                            NavigationLink(
                                destination: MovieDetailsView(movie: value),
                                label: {
                                    VStack(spacing: 8) {
                                        Image(value.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 180)
                                            .clipped()
                                            .cornerRadius(8)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color(white: 0.4))
                                            )
                                            .shadow(radius: 3)
                                        Text(value.title)
                                            .font(.system(size: 16, weight: .semibold))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        HStack(spacing: 0) {
                                            ForEach(0..<value.likes, id: \.self) { num in
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.orange)
                                                    .font(.system(size: 14))
                                            }
                                        }.padding(.top, -4)
                                    }
                                })
                             
                                .scaleEffect(.init(width: scale, height: scale))
                                .padding(.vertical)
                        } //End Geometry
                        .frame(width: 125, height: 400)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 32)
                    } //End ForEach
                    Spacer()
                        .frame(width: 16)
                } //End HStack
            }// End ScrollView
        }//End VStack
    }
     
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 125
        
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
         
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
         
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
         
        return scale
    }
}
 
struct MoviesCarousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(categoryName: "Filmes").environmentObject(ViewModelMuvies())
    }
}
