//
//  ContentView.swift
//  Prueba SwiftUI
//
//  Created by Milton Putallaz on 04/10/2024.
//

import SwiftUI
import Resolver
import SwiftData

struct MainView: View {
    @EnvironmentObject var router: Router
    @InjectedObject var mainViewModel: MainViewModel
    @Query(sort: \Movie.id, order: .reverse) private var moviesList: [Movie]
    
    var body: some View {
        List(moviesList) { movie in
            Text(movie.title)
         }
         .navigationTitle("Movies")
         .task {
             mainViewModel.getNowPlaying()
         }
         .alert(isPresented: $mainViewModel.showError, error: mainViewModel.errorMessage, actions: {})
    }
}

#Preview {
    MainView()
}
