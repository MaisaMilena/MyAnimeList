//
//  AnimeWorker.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit

class AnimeDatabaseWorker {
    
    static func addAnime(request: AddAnime.Request) -> Bool{
        let isAnimeAdded = AnimeDatabase.instance.add(anime: request.anime)
        return isAnimeAdded
    }
    
    
}

