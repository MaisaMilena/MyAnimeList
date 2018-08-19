//
//  AnimeWorker.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit

class AnimeWorker {
    /**
     Add a new anime on the database
     - parameter request: a Request Model to add animes
     - returns: true if the anime was successfuly added
     */
    static func addAnime(request: AddAnime.Request) -> Bool {
        let isAnimeAdded = AnimeDatabase.instance.add(anime: request.anime)
        return isAnimeAdded
    }
    
    /**
     Get animes based on a status
     - parameter request: a Request Model to list animes
     - returns: a list of anime
     */
    static func getAnimes(request: ListAnime.Request) -> ListAnime.Response {
        var category: ListAnime.Request
        switch request.animeCategory {
        case .toWatch:
            category.animeCategory = .toWatch
            break
        case .watched:
            category.animeCategory = .watched
        default:
            category.animeCategory = nil
        }
        let animes = AnimeDatabase.instance.getAnimes(category)
        return ListAnime.Response.init(animes: animes)
    }
    
}

