//
//  AddAnimeViewController.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Class to control the view of the scene.
 */
class AddAnimeViewController: UIViewController, AddAnimePresenterOutput {
    
    // Delegate
    var output: AddAnimeInteractorInput!
    var router: AddAnimeRouter!
    
    // MARK: - User input
    @IBOutlet weak var animeTitle: UITextField!
    @IBOutlet weak var animeDescription: UITextView!
    @IBOutlet weak var rating: UISlider!
    @IBOutlet weak var isWatched: UISwitch!
    
    // MARK: - Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        AddAnimeConfigurator.inject(dependenciesFor: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        AddAnimeConfigurator.inject(dependenciesFor: self)
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Event handling
    @IBAction func submitAnimeAction(_ sender: Any) {
        guard let title = animeTitle?.text,
              let description = animeDescription?.text,
              let rating = rating?.value,
              let watched = isWatched?.isOn else {
                return
        }

        let status: AnimeStatusType = watched ? .watched : .toWatch
        let anime = Anime(title: title,
                          description: description,
                          rating: Int(rating),
                          status: status)

        let request = AddAnime.Request(anime: anime)
        output.addAnimeOnDatabase(request)
    }
    
    // MARK: - Display logic
    func displayMessage(_ isAnimeAdded: AddAnime.Response) {
        router.navigateToHome()
    }
}
