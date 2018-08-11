//
//  AnimeDatabase.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit

class AnimeDatabase {
    private var animes: [Anime] = [Anime()]
    
    public static var instance = AnimeDatabase()
    
    private init() {}

    // MARK: database functions
    func add(anime: Anime) -> Bool {
        animes.append(anime)
        print("Anime on database: ", anime.description)
        return animes.last?.title == anime.title ? true : false
    }
    
    func all() -> [Anime] {
        return animes
    }
    
    subscript(index: Int) -> Anime {
        get {
            return animes[index]
        }
        set(newValue) {
            animes[index] = newValue
        }
    } 
}
