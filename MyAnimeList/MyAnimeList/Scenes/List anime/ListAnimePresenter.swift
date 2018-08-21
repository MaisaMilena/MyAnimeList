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
    func displayAnime(_ response: ListAnime.Response)
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
