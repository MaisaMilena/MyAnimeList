//
//  AddAnimeConfigurator.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Class to build view controller's dependency tree. Makes and links ViewController, Interactor, and Presenter objects.
 */
class AddAnimeConfigurator {
    static func inject(dependenciesFor viewController: AddAnimeViewController) {
        if viewController.output != nil {
            return
        }
        
        let router = AddAnimeRouter()
        router.viewController = viewController
        viewController.router = router
        
        let presenter = AddAnimePresenter()
        let interactor = AddAnimeInteractor()
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
    }
}
