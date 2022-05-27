//
//  MovieDetailsContentView.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import SwiftUI

struct MovieDetailsContentView: View{
    var movie : Movie
    
    @ObservedObject private var dataView = MovieDetailsViewModel(data: NetworkManagerDetailsMovie(), id: 526896)
    
    var body: some View {
        
        List {
            Text(movie.originalTitle)
                .font(.headline).bold()
            
            VStack(alignment: .center, spacing: MoviesViewConstant.detailsMovies.spacingCell){
                if let imgPath: String = String(format: MoviesViewConstant.viewDetails.apiMainImg, movie.posterPath), let url = URL(string: imgPath) {
                    AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .transition(.slide)
                                .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                                
                        } placeholder: {
                            ProgressView()
                        }
                }
                Text(MoviesDetailsConstant.textViewDetails.titleGallery)
                    .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeTitleGallery, weight: .bold, design: .default))
                
                ScrollView(.horizontal) {
                      HStack {
                          ForEach(dataView.imagesMovies) { list in
                              if let imgPath: String = String(format: MoviesViewConstant.viewDetails.apiMainImg, list.filePath), let url = URL(string: imgPath) {
                                  
                                  AsyncImage(url: url) { image in
                                          image
                                              .resizable()
                                              .scaledToFill()
                                              .transition(.slide)
                                              .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                                              
                                      } placeholder: {
                                          ProgressView()
                                      }
                              }
                          }
                      }
                    }
                Text(MoviesDetailsConstant.textViewDetails.titleSummary)
                    .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeTitleSummary, weight: .bold, design: .default))
                Text(dataView.detailsMovie?.backdropPath ?? "")
                Spacer()
            }
                        
        }
    }
}
