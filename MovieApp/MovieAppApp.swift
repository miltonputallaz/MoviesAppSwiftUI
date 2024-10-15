//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Milton Putallaz on 06/10/2024.
//

import SwiftUI
import SwiftData
import Resolver

@main
struct MovieAppApp: App {
    let sharedModelContainer: ModelContainer

    @ObservedObject var router = Router()
    @Injected var baseLocalRepository: BaseLocalRepository
    
    init() {
        sharedModelContainer = {
            let schema = Schema([
                Movie.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
                return container
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        baseLocalRepository.containerContext = sharedModelContainer.mainContext
    }
    
    var body: some Scene {
        WindowGroup {
               NavigationStack(path: $router.navPath) {
                   MainView()
                   .navigationDestination(for: Router.Destination.self) { destination in
                       switch destination {
                       case .page2:
                           Page2()
                       case .page3:
                           Page3()
                       }
                   }
                   
                }
               .environmentObject(router)
        }
        .modelContainer(sharedModelContainer)
    }
}
