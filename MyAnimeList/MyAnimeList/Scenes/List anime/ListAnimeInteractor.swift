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
    func doSomething(_ request: ListAnime.Request)
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
    func doSomething(_ request: ListAnime.Request) {
        // NOTE: Create some Entity to do the work
        //let entity = ListAnimeWorker()
        //entity.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = ListAnime.Response()
        output.presentSomething(response)
    }
}
