//
//  MovieDetailsContentView.swift
//  DemoTest
//
//  Created by Dahyanna on 26-05-22.
//

import SwiftUI
import iActivityIndicator

struct MovieDetailsContentView: View{
    var movie : Movie
    
    @ObservedObject private var dataViewModel = MovieDetailsViewModel()
    
    var body: some View {
        
        List {
            Text(movie.originalTitle)
                .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeTitleGallery, weight: .bold, design: .default))
            
            VStack(alignment: .center, spacing: MoviesViewConstant.detailsMovies.spacingCell){
                if let imgPath: String = String(format: MoviesViewConstant.viewDetails.apiMainImg, movie.posterPath), let url = URL(string: imgPath) {
                    AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .transition(.slide)
                                .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                                
                        } placeholder: {
                            iActivityIndicator(style: .arcs(width: 6))
                        }
                }
                Text(MoviesDetailsConstant.textViewDetails.titleGallery)
                    .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeSubTitle, weight: .bold, design: .default))
                
                ScrollView(.horizontal) {
                      HStack {
                          ForEach(dataViewModel.imagesMovies) { list in
                              if let imgPath: String = String(format: MoviesViewConstant.viewDetails.apiMainImg, list.filePath), let url = URL(string: imgPath) {
                                  
                                  AsyncImage(url: url) { image in
                                          image
                                              .resizable()
                                              .scaledToFill()
                                              .transition(.slide)
                                              .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                                              
                                      } placeholder: {
                                          iActivityIndicator(style: .blinking(count: 4))
                                      }
                              }
                          }
                      }
                    }
                
                if let dateAvailable = dataViewModel.detailsMovie?.releaseDateText{
                    Text(dateAvailable)
                        .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeDateAvailable, weight: .bold, design: .default))
                }
                
                if let typegenre = dataViewModel.detailsMovie?.listGenres{
                    Text(typegenre)
                        .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeTypeGenre, weight: .semibold, design: .default))
                }
                
                Text(MoviesDetailsConstant.textViewDetails.titleSummary)
                    .font(.system(size: MoviesDetailsConstant.detailsMovies.sizeSubTitle, weight: .bold, design: .default))
                
                if let overview = dataViewModel.detailsMovie?.overview{
                    Text(overview)
                }
                
                if let homePage = dataViewModel.detailsMovie?.homepage {
                    Text(.init(MoviesDetailsConstant.textViewDetails.linkMovie + " 👉🏽: \(homePage)"))
                }
                Spacer()
            }
                        
        }
        .onAppear {
            dataViewModel.idmovie = movie.id
        }
    }
}
