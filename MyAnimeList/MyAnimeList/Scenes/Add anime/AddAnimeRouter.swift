//
//  AddAnimeRouter.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
 */
class AddAnimeRouter {
    weak var viewController: AddAnimeViewController?
    
    // MARK: Manual navigation
    func navigateToHome() {
        viewController?.performSegue(withIdentifier: "addToHomeSegue", sender: nil)
    }
    
    // MARK: Scene communication
    func passDataBetweenScenes(of segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == "ShowSomewhereScene" {
            sendDataToSomewhereScene(segue)
        }
    }
    
    func sendDataToSomewhereScene(_ segue: UIStoryboardSegue) {
        // NOTE: Teach the router how to pass data to the next scene
        // let someWhereViewController = segue.destination as! SomeWhereViewController
        // someWhereviewController.objectId = viewController?.objectId
    }
}
