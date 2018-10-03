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
    @IBOutlet weak var isWatched: UISwitch!
    @IBOutlet private weak var ratingStackView: UIStackView!
    private var rating: Int = 0
    
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
              let watched = isWatched?.isOn else {
                return
        }
        if title.isEmpty && description.isEmpty {
            let alertVC = UIAlertController(title: "Oops", message: "Title and description must not be empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
            alertVC.addAction(ok)
            present(alertVC, animated: true, completion: nil)
        } else {
            let status: AnimeStatusType = watched ? .watched : .toWatch
            let anime = Anime(title: title,
                              description: description,
                              rating: Int(rating),
                              status: status)
            
            let request = AddAnime.Request(anime: anime)
            output.addAnimeOnDatabase(request)
        }
    }
    
    @IBAction func onTouchUpRating(_ sender: UIButton) {
        rating = sender.tag
        updateRatingView()
    }
    
    // MARK: - Display logic
    func displayMessage(_ isAnimeAdded: AddAnime.Response) {
        router.navigateToHome()
    }
    
    private func updateRatingView() {
        for i in 0..<5 {
            let button = ratingStackView.arrangedSubviews[i] as! UIButton
            button.isSelected = i < rating
        }
    }
}
