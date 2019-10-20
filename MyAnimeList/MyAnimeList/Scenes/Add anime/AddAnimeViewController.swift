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
class AddAnimeViewController: UITableViewController, AddAnimePresenterOutput {

    private enum Constant {
        static let ratingLimit: Int = 5
    }

    // Delegate
    var output: AddAnimeInteractorInput!
    var router: AddAnimeRouter!

    // MARK: - User input
    @IBOutlet weak var animeTitle: UITextField!
    @IBOutlet weak var animeDescription: UITextView!
    @IBOutlet weak var isWatched: UISwitch!
    @IBOutlet weak var ratingTextField: UITextField!

    private var rating: Int {
        guard let value = ratingTextField.text else {
            return .zero
        }
        return Int(value) ?? .zero
    }
    
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

        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Event handling
    @IBAction func cancelAction(_ sender: Any) {
        router.navigateToHome()
    }

    @IBAction func submitAnimeAction(_ sender: Any) {
        guard let title = animeTitle?.text,
              let description = animeDescription?.text,
              let watched = isWatched?.isOn else {
                return
        }
        if title.isEmpty || description.isEmpty {
            let alertVC = UIAlertController(title: "Oops", message: "Title and description must not be empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
            alertVC.addAction(ok)
            present(alertVC, animated: true, completion: nil)
        } else {
            let status: AnimeStatusType = watched ? .watched : .toWatch
            let anime = Anime(title: title,
                              description: description,
                              rating: rating,
                              status: status)
            
            let request = AddAnime.Request(anime: anime)
            output.addAnimeOnDatabase(request)
        }
    }

    // MARK: - Display logic
    func displayMessage(_ isAnimeAdded: AddAnime.Response) {
        let alertVC = UIAlertController(title: "Yeah!", message: "Anime added with success", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Got it", style: .default) { (action) in
            self.router.navigateToHome()
        }
        alertVC.addAction(ok)
        present(alertVC, animated: true, completion: nil)
        
    }

}

extension AddAnimeViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField == ratingTextField,
            !string.isEmpty else {
            return true
        }
        if textField.text?.isEmpty == true,
            string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil,
        .zero ... Constant.ratingLimit ~= (Int(string) ?? .zero) {
          return true
       } else {
          return false
       }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case animeTitle:
            ratingTextField.becomeFirstResponder()
            return false
        default:
            ratingTextField.resignFirstResponder()
            return true
        }
    }
}
