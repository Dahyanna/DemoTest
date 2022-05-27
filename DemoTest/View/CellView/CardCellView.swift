//
//  CardCellView.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import SwiftUI


struct CardCellView: View {
    let movie: Movie
    var body: some View {
        VStack {
            if let imgPath: String = String(format: MoviesViewConstant.viewDetails.apiMainImg, movie.posterPath), let url = URL(string: imgPath) {
                AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .transition(.slide)
                    } placeholder: {
                        ProgressView()
                    }
            }
            Text(movie.originalTitle)
                .font(.system(size: MoviesViewConstant.detailsMovies.sizeTitle, weight: .bold, design: .default))
            
            Text(movie.votes)
                .font(.system(size: MoviesViewConstant.detailsMovies.sizeSubTitle, weight: .light, design: .default))
        }
        .padding(MoviesViewConstant.detailsMovies.spacingCell)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPageMoviesView()
    }
}
