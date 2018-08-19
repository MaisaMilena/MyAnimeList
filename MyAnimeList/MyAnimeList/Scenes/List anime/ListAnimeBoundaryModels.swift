//
//  ListAnimeBoundaryModels.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct ListAnime {
    
    struct Request {
        var animeCategory: AnimeStatusType
    }
    
    struct Response {
        var animes: [Anime]
        struct ViewModel {
            
        }
    }

    
}

