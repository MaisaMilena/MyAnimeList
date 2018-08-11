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
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataBetweenScenes(of: segue)
    }
    
    // MARK: - Event handling
    @IBAction func submitAnimeAction(_ sender: Any) {
        var anime = Anime()
        anime.title = animeTitle.text
        anime.description = animeDescription.text
        anime.rating = Int(rating.value)
        anime.status = isWatched.isOn ? StatusAnime.watched : StatusAnime.toWatch
        
        let request = AddAnime.Request(anime: anime)
        output.addAnimeOnDatabase(request)
        
    }
    
    // MARK: - Display logic
    func displayMessage(_ isAnimeAdded: AddAnime.Response) {
        print("Is anime added on database? \(isAnimeAdded.addAnimeAction)")
        performSegue(withIdentifier: "addToHomeSegue", sender: nil)
    }
}
