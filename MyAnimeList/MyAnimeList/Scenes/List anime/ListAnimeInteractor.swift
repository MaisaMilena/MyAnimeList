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
    func presentAnime(_ response: ListAnime.Response)
    func getQtdAnime(qtd: Int)
}

// MARK: Class
/**
    Class to <#business#>.
 */
class ListAnimeInteractor: ListAnimeInteractorInput {
    
    var output: ListAnimeInteractorOutput!
    
    // MARK: Business logic
    // Request from ViewController
    func getAnimes(_ request: ListAnime.Request) {
        let response = AnimeWorker.getAnimes(request: request)
        output.presentAnime(response)
        output.getQtdAnime(qtd: response.animes.count)
    }
    
}
