//
//  AddAnimePresenter.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

// MARK: Boundary protocol
protocol AddAnimePresenterOutput: class {
    func displaySomething(_ viewModel: AddAnime.Response.ViewModel)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class AddAnimePresenter: AddAnimeInteractorOutput {
    weak var output: AddAnimePresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(_ response: AddAnime.Response) {
        let viewModel = AddAnime.Response.ViewModel()
        output?.displaySomething(viewModel)
    }
}
