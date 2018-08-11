//
//  ListAnimeViewController.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Class to control the view of the scene.
 */
class ListAnimeViewController: UIViewController, ListAnimePresenterOutput {
    var output: ListAnimeInteractorInput!
    var router: ListAnimeRouter!
    
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        ListAnimeConfigurator.inject(dependenciesFor: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ListAnimeConfigurator.inject(dependenciesFor: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }
    
    // MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataBetweenScenes(of: segue)
    }
    
    // MARK: Event handling
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = ListAnime.Request()
        output.doSomething(request)
    }
    
    // MARK: Display logic
    func displaySomething(_ viewModel: ListAnime.Response.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }
}
