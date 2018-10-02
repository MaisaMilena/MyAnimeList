//
//  AnimeWorker.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit
/**
Intermediate layer between the app Request and the database.
 As the app is very small, is used a single Worker for both Scenes.
 */
class AnimeWorker {
    /**
     Add a new anime on the database
     - parameter request: a Request Model to add animes
     - returns: true if the anime was successfuly added
     */
    static func addAnime(request: AddAnime.Request,
                         database: AnimeDatabase = InMemoryAnimeDatabase.instance) -> Bool {
        let isAnimeAdded = database.add(anime: request.anime)
        return isAnimeAdded
    }
    
    /**
     Get animes based on a status
     - parameter request: a Request Model to list animes
     - returns: a list of anime
     */
    static func getAnimes(request: ListAnime.Request,
                          database: AnimeDatabase = InMemoryAnimeDatabase.instance) -> ListAnime.Response {
        var category: ListAnime.Request
        switch request.animeCategory {
        case .toWatch:
            category = ListAnime.Request.init(animeCategory: .toWatch)
            break
        case .watched:
            category = ListAnime.Request.init(animeCategory: .watched)
        default:
            category = ListAnime.Request.init(animeCategory: .none)
        }
        let animes = database.getAnimes(category.animeCategory)
        return ListAnime.Response.init(animes: animes)
    }
    
}

