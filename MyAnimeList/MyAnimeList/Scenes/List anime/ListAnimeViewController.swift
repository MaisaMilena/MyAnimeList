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
class ListAnimeViewController: UITableViewController, ListAnimePresenterOutput {
    var output: ListAnimeInteractorInput!
    var router: ListAnimeRouter!
    
    // MARK: - View elements
    @IBOutlet weak var tableViewController: UITableView!
    @IBOutlet weak var animeStatus: UISegmentedControl!
    
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
    }
    
    // MARK: Segues
    
    @IBAction func addAnime(_ sender: Any) {
        router.homeToAddAnime()
        print("Add anime")
    }
 
    @IBAction func animeStatusSelection(_ sender: Any) {
        print("Segmented clicked")
    }
    
    
    // MARK: Display logic
    func displaySomething(_ viewModel: ListAnime.Response.ViewModel) {
        // NOTE: Display the result from the Presenter
        // nameTextField.text = viewModel.name
    }

    
}

extension ListAnimeViewController: UIPageViewControllerDelegate {
    
}

