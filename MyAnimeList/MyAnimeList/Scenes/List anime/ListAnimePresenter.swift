//
//  ListAnimePresenter.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

// MARK: Boundary protocol
protocol ListAnimePresenterOutput: class {
    /**
     Defines what will me presented about an anime
     - parameter response: response structure. The raw data are presented
     */
    func displayAnime(_ response: ListAnime.Response)
    /**
     Used to get the quantity of animes
     - parameter qtd: the quantity of animes in the database
     */
    func getQtdAnime(qtd: Int)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class ListAnimePresenter: ListAnimeInteractorOutput {

   // View Controller
    weak var output: ListAnimePresenterOutput?
    
    // MARK: Presentation logic
    func presentAnime(_ response: ListAnime.Response) {
        output?.displayAnime(response)
    }
    
    func getQtdAnime(qtd: Int) {
        output?.getQtdAnime(qtd: qtd)
    }
}
