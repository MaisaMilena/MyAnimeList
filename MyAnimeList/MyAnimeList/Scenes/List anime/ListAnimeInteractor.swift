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
    /**
     Get animes given a category
     - parameter request: a request format to get animes
     */
    func getAnimes(_ request: ListAnime.Request)
}

protocol ListAnimeInteractorOutput {
    /**
     Presents anime given a response
     - parameter response: response structure
     */
    func presentAnime(_ response: ListAnime.Response)
    /**
     Used to get the quantity of animes
     - parameter qtd: the quantity of animes in the database
     */
    func getQtdAnime(qtd: Int)
}

// MARK: Class
/**
    Class to get animes in a database.
 */
class ListAnimeInteractor: ListAnimeInteractorInput {
    
    // Presenter
    var output: ListAnimeInteractorOutput!
    
    // MARK: Business logic
    
    // Request from ViewController
    func getAnimes(_ request: ListAnime.Request) {
        let response = AnimeWorker.getAnimes(request: request)
        output.presentAnime(response)
        output.getQtdAnime(qtd: response.animes.count)
    }
    
}
