//
//  AddAnimeInteractor.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

// MARK: Boundary protocols
protocol AddAnimeInteractorInput {
    func addAnimeOnDatabase(_ request: AddAnime.Request)
}

protocol AddAnimeInteractorOutput {
    func animeAdded(_ response: AddAnime.Response)
}

// MARK: Class
/**
    Class to add anime in a local class.
 */
class AddAnimeInteractor: AddAnimeInteractorInput {
    var output: AddAnimeInteractorOutput!
    
    // MARK: Business logic
    func addAnimeOnDatabase(_ request: AddAnime.Request) {
        let workerResponse = AnimeWorker.addAnime(request: request)
        
        // Pass the result to the Presenter
        let response = AddAnime.Response(addAnimeAction: workerResponse)
        output.animeAdded(response)
    }
    
}
