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
    func doSomething(_ request: AddAnime.Request)
}

protocol AddAnimeInteractorOutput {
    func presentSomething(_ response: AddAnime.Response)
}

// MARK: Class
/**
    Class to <#business#>.
 */
class AddAnimeInteractor: AddAnimeInteractorInput {
    var output: AddAnimeInteractorOutput!
    
    // MARK: Business logic
    func doSomething(_ request: AddAnime.Request) {
        // NOTE: Create some Entity to do the work
        //let entity = AddAnimeWorker()
        //entity.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = AddAnime.Response()
        output.presentSomething(response)
    }
}
