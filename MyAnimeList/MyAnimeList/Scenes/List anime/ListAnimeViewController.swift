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

    // Delegate
    var output: ListAnimeInteractorInput!
    var router: ListAnimeRouter!
    
    // Anime information
    private var qtdAnime: Int = 0
    private var animes: [Anime] = []
    
    // View elements
    @IBOutlet weak var animeStatus: UISegmentedControl!
    
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        ListAnimeConfigurator.inject(dependenciesFor: self)
        
        let request = ListAnime.Request.init(animeCategory: .toWatch)
        output.getAnimes(request)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ListAnimeConfigurator.inject(dependenciesFor: self)
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AnimeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "animeCellIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let request = ListAnime.Request.init(animeCategory: .toWatch)
        output.getAnimes(request)
        // Reloads the content of table view
        tableView.reloadData()
    }

    // MARK: - Event handling
    @IBAction func addAnime(_ sender: Any) {
        router.homeToAddAnime()
    }
 
    /**
     Updates the content of table view for Anime Watched and Anime To Watch
     */
    @IBAction func animeStatusSelection(_ sender: Any) {
        // index 0 is toWatch category
        let category = animeStatus.selectedSegmentIndex == 0 ? AnimeStatusType.toWatch : AnimeStatusType.watched
        
        // make a request for interactor
        let request = ListAnime.Request.init(animeCategory: category)
        output.getAnimes(request)
        
        // Reloads the content of table view
        tableView.reloadData()
    }
    
    // MARK: Display logic
    func displayAnime(_ response: ListAnime.Response) {
        animes = response.animes
    }

    func getQtdAnime(qtd: Int) {
        qtdAnime = qtd
    }
}

extension ListAnimeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qtdAnime
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animeCellIdentifier", for: indexPath) as! AnimeTableViewCell
        let anime = animes[indexPath.row]
        cell.animeTitle.text = anime.title
        cell.animeDescription.text = anime.description
        cell.ratingScore.text = String(anime.rating)
        return cell 
    }
    
}





