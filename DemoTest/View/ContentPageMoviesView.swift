//
//  ContentPageMoviesView.swift
//  DemoTest
//
//  Created by Dahyanna on 25-05-22.
//

import SwiftUI

struct ContentPageMoviesView: View {
    @ObservedObject var model = MovieViewModel(data: NetworkManager())
    
       var columns: [GridItem] = [
           GridItem(.flexible()),
           GridItem(.flexible()),
       ]
       
       var body: some View {
           NavigationView{
               TabView{
                   //Popular
                   ScrollView {
                       LazyVGrid(columns: columns, spacing: MoviesViewConstant.pageMovies.spacingCell) {
                           ForEach(model.popularMovies) { popular in
                               NavigationLink(destination: MovieDetailsContentView(movie: popular)) {
                                   CardCellView(movie: popular)
                                       .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                               }
                           }
                       }
                       .padding()
                   }
                   .tabItem {
                       Image(systemName: "star.fill")
                       Text(MoviesViewConstant.labelText.popularTitle)
                       
                   }
                   
                   //Top Rate
                   ScrollView {
                       LazyVGrid(columns: columns, spacing: MoviesViewConstant.pageMovies.spacingCell) {
                           ForEach(model.topRateMovies) { movie in
                               NavigationLink(destination: MovieDetailsContentView(movie: movie)) {
                                   CardCellView(movie: movie)
                                       .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                               }
                           }
                       }
                       .padding()
                   }
                   .tabItem {
                       Image(systemName: "bookmark.circle.fill")
                       Text(MoviesViewConstant.labelText.toprateTitle)
                       
                   }
                   
                   //Upcomming
                   ScrollView {
                       LazyVGrid(columns: columns, spacing: MoviesViewConstant.pageMovies.spacingCell) {
                           ForEach(model.upcommingMovies) { movie in
                               NavigationLink(destination: MovieDetailsContentView(movie: movie)) {
                                   CardCellView(movie: movie)
                                       .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                               }
                           }
                       }
                       .padding()
                   }
                   .tabItem {
                       Image(systemName: "ticket.fill")
                       Text(MoviesViewConstant.labelText.upcommingTitle)
                       
                   }
                   
                   //Now Playing
                   ScrollView {
                       LazyVGrid(columns: columns, spacing: MoviesViewConstant.pageMovies.spacingCell) {
                           ForEach(model.nowPlayingMovies) { movie in
                               NavigationLink(destination: MovieDetailsContentView(movie: movie)) {
                                   CardCellView(movie: movie)
                                       .frame(maxWidth: MoviesViewConstant.detailsMovies.widthCell, maxHeight: MoviesViewConstant.detailsMovies.heightCell, alignment: .center)
                               }
                           }
                       }
                       .padding()
                   }
                   .tabItem {
                       Image(systemName: "gamecontroller.fill")
                       Text(MoviesViewConstant.labelText.nowPlayingTitle)
                       
                   }
               }
               .navigationBarTitle(MoviesViewConstant.labelText.titleNavigation, displayMode: .inline)
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPageMoviesView()
    }
}
