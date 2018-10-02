//
//  AnimeDatabase.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit

protocol AnimeDatabase {
    /**
     Add a new anime on the database
     - parameter anime: an anime object
     - returns: true if the anime was successfully added
     */
    func add(anime: Anime) -> Bool

    /**
     Get animes given a category
     - parameter status: a status of an anime. Use "none" to get all animes registered
     - returns: a set of animes
     */
    func getAnimes(_ status: AnimeStatusType) -> [Anime]
    subscript(index: Int) -> Anime { get set }
}

/**
 In memory simple database. Manage simple actions as store data, add and list objects
 */
class InMemoryAnimeDatabase: AnimeDatabase {
    private var animes: [Anime] = [Anime()]
    
    public static var instance = InMemoryAnimeDatabase()
    
    /**
     Create some sample data
     */
    private init() {
        
        var saikiKusuo = Anime()
        saikiKusuo.title = "Saiki Kusuo no psi-nan"
        saikiKusuo.description = "To the average person, psychic abilities might seem a blessing; for Kusuo Saiki, however, this couldn't be further from the truth"
        saikiKusuo.rating = 5
        saikiKusuo.status =  AnimeStatusType.watched
        
        var melancoly = Anime()
        melancoly.title = "The Melancholy of Haruhi Suzumiya"
        melancoly.description = "Haruhi Suzumiya was about this girl named The Melancholy, who was desperately trying to convince herself that she was living inside of an anime, and that she was secretly god"
        melancoly.rating = 5
        melancoly.status = AnimeStatusType.toWatch
        
        var steins = Anime()
        steins.title = "Steins Gate"
        steins.description = "Adapted from the critically acclaimed visual novel by 5pb. and Nitroplus, Steins;Gate takes Okabe through the depths of scientific theory and practicality. Forced across the diverging threads of past and present, Okabe must shoulder the burdens that come with holding the key to the realm of time"
        steins.rating = 5
        steins.status = AnimeStatusType.watched
        
        animes.append(saikiKusuo)
        animes.append(melancoly)
        animes.append(steins)
    }

    // MARK: database functions

    func add(anime: Anime) -> Bool {
        animes.append(anime)
        return animes.last?.title == anime.title ? true : false
    }

    func getAnimes(_ status: AnimeStatusType) -> [Anime]{
        switch status {
        case .toWatch:
            return animes.filter{$0.status == AnimeStatusType.toWatch}
        case .watched:
            return animes.filter{$0.status == AnimeStatusType.watched}
        default:
            return animes
        }
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
