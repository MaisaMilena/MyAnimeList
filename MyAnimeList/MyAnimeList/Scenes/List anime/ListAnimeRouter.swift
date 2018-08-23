//
//  ListAnimeRouter.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
 */
class ListAnimeRouter {
    weak var viewController: ListAnimeViewController?
    
    // MARK: Manual navigation
    func homeToAddAnime() {
        viewController?.performSegue(withIdentifier: "HomeToAddSegue", sender: nil)
        print("Router go to AddAnime")
    }
    
    // MARK: Scene communication
//    func passDataBetweenScenes(of segue: UIStoryboardSegue) {
//        // NOTE: Teach the router which scenes it can communicate with
//        if segue.identifier == "ShowSomewhereScene" {
//            sendDataToSomewhereScene(segue)
//        }
//    }
//    
//    func sendDataToSomewhereScene(_ segue: UIStoryboardSegue) {
//        // NOTE: Teach the router how to pass data to the next scene
//        // let someWhereViewController = segue.destination as! SomeWhereViewController
//        // someWhereviewController.objectId = viewController?.objectId
//    }
}
