//
//  ListAnimeInteractor.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

// MARK: Boundary protocols
protocol ListAnimeInteractorInput {
    func getAnimes(_ request: ListAnime.Request)
}

protocol ListAnimeInteractorOutput {
    func presentSomething(_ response: ListAnime.Response)
}

// MARK: Class
/**
    Class to <#business#>.
 */
class ListAnimeInteractor: ListAnimeInteractorInput {
    
    var output: ListAnimeInteractorOutput!
    
    // MARK: Business logic
    // Request from ListAnimeInteractor
    func getAnimes(_ request: ListAnime.Request) {
        let response = AnimeWorker.getAnimes(request: request)
        output.presentSomething(response)
    }
    
}
