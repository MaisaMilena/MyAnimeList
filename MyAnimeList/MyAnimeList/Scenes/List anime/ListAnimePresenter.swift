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
    func displaySomething(_ viewModel: ListAnime.Response.ViewModel)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class ListAnimePresenter: ListAnimeInteractorOutput {
    weak var output: ListAnimePresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(_ response: ListAnime.Response) {
        let viewModel = ListAnime.Response.ViewModel()
        output?.displaySomething(viewModel)
    }
}
