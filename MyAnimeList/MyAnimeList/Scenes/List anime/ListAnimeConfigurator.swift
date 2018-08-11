//
//  ListAnimeConfigurator.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Class to build view controller's dependency tree. Makes and links ViewController, Interactor, and Presenter objects.
 */
class ListAnimeConfigurator {
    static func inject(dependenciesFor viewController: ListAnimeViewController) {
        if viewController.output != nil {
            return
        }
        
        let router = ListAnimeRouter()
        router.viewController = viewController
        viewController.router = router
        
        let presenter = ListAnimePresenter()
        let interactor = ListAnimeInteractor()
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
    }
}
