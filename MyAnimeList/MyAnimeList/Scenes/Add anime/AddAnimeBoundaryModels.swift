//
//  AddAnimeBoundaryModels.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct AddAnime {
    struct Request {
        var anime: Anime
    }
    struct Response {
        var addAnimeAction: Bool
    }
}
