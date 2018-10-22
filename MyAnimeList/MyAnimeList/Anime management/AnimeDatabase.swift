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
}

/**
 In memory simple database. Manage simple actions as store data, add and list objects
 */
class InMemoryAnimeDatabase: AnimeDatabase {
    private var animes: [Anime]
    
    public static var instance = InMemoryAnimeDatabase()
    
    /**
     Create some sample data
     */
    private init() {
        let saikiKusuo = Anime(title: "Saiki Kusuo no psi-nan",
                               description: "To the average person, psychic abilities might seem a blessing; for Kusuo Saiki, however, this couldn't be further from the truth",
                               rating: 5,
                               status: .toWatch)
        
        let melancoly = Anime(title: "The Melancholy of Haruhi Suzumiya",
                              description: "Haruhi Suzumiya was about this girl named The Melancholy, who was desperately trying to convince herself that she was living inside of an anime, and that she was secretly god",
                              rating: 5,
                              status: .watched)
        
        let steins = Anime(title: "Steins;Gate",
                           description: "Adapted from the critically acclaimed visual novel by 5pb. and Nitroplus, Steins;Gate takes Okabe through the depths of scientific theory and practicality. Forced across the diverging threads of past and present, Okabe must shoulder the burdens that come with holding the key to the realm of time",
                           rating: 5,
                           status: .watched)
        
        let jojo = Anime(title: "JoJo no Kimyou na Bouken", description: "JoJo's Bizarre Adventure tells the story of the Joestar family, a family whose various members discover they are destined to take down supernatural foes using powers that they possess. The story is split up into unique parts, each following one member of the Joestar family, who inevitably has a name that can be abbreviated to the titular \"JoJo\".", rating: 5, status: .toWatch)
        
        self.animes = [saikiKusuo, melancoly, steins, jojo]
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
