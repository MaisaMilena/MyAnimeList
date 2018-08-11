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
    
    private init() {
        var saikiKusuo = Anime()
        saikiKusuo.title = "Saiki Kusuo no psi-nan"
        saikiKusuo.description = "To the average person, psychic abilities might seem a blessing; for Kusuo Saiki, however, this couldn't be further from the truth"
        saikiKusuo.rating = 5
        saikiKusuo.status =  StatusAnime.watched
        
        var melancoly = Anime()
        melancoly.title = "The Melancholy of Haruhi Suzumiya"
        melancoly.description = "Haruhi Suzumiya was about this girl named The Melancholy, who was desperately trying to convince herself that she was living inside of an anime, and that she was secretly god"
        melancoly.rating = 5
        melancoly.status = StatusAnime.toWatch
        
        animes.append(saikiKusuo)
        animes.append(melancoly)
    }

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
