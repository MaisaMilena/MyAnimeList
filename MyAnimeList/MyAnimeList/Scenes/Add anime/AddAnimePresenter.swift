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
    /**
     Displays a message about "add anime" action
     */
    func displayMessage(_ isAnimeAdded: AddAnime.Response)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class AddAnimePresenter: AddAnimeInteractorOutput {
    
    // View Controller
    var output: AddAnimePresenterOutput!
    
    // MARK: Presentation logic
    func animeAdded(_ response: AddAnime.Response) {
        // respondes if the anime were added or not
        let response = AddAnime.Response(addAnimeAction: response.addAnimeAction)
        output.displayMessage(response)
    }
}
