//
//  RealmDatabase.swift
//  MyAnimeList
//
//  Created by Francesco Perrotti Garcia on 10/2/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmEncodable {
    associatedtype RealmType
    func encode() -> RealmType
}

protocol RealmDecodable {
    associatedtype InternalType
    func decode() -> InternalType
}

final class RealmDatabase: AnimeDatabase {
    let realm: Realm

    init(realm: Realm) {
        self.realm = realm
        let saikiKusuo = Anime(title: "Saiki Kusuo no psi-nan",
                               description: "To the average person, psychic abilities might seem a blessing; for Kusuo Saiki, however, this couldn't be further from the truth",
                               rating: 5,
                               status: .toWatch)
        
        let hunter = Anime(title: "Hunter x Hunter",
                               description: "Abundant riches, hidden treasures, fearsome monsters, and exotic creatures are scattered around the world... Gon departs on a journey to become a Pro Hunter who risks his life in search of the unknown. Along the way, he meets other applicants for the Hunter exam: Kurapika, Leorio, and Killua. Can Gon pass the rigorous challenges of the Hunter exam and become the best Hunter in the world!? His wild and epic journey is about to begin!!",
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
        let kuroko = Anime(title: "Kuroko no Basuke",
                           description: "Kuroko no Basket follows the journey of Seirin's players as they attempt to become the best Japanese high school team by winning the Interhigh Championship. To reach their goal, they have to cross pathways with several powerful teams, some of which have one of the five players with godlike abilities, whom Kuroko and Taiga make a pact to defeat",
                           rating: 4,
                           status: .toWatch)
        let punch = Anime(title: "One Punch-Man",
                           description: "One-Punch Man tells the story of Saitama, an extremely overpowered superhero who has grown bored by the absence of challenge in his fight against evil and seeks to find a worthy opponent.",
                           rating: 5,
                           status: .toWatch)

        let avatar = Anime(title: "Avatar: The Last Airbender",
                           description: "Human civilization is divided into four nations, named after the four classical elements: the Water Tribes, the Earth Kingdom, the Fire Nation, and the Air Nomads. Each nation has a distinct society in which select people, known as 'benders' (waterbenders, earthbenders, firebenders and airbenders), have the ability to telekinetically manipulate and control their nation's element using martial arts. Only the Avatar has the ability to bend all four elements.",
                           rating: 5,
                           status: .toWatch)

        
        let maouSama = Anime(title: "Hataraku Maou-sama!",
                             description: "Powerless in a world without magic, Satan assumes the guise of a human named Sadao Maou and begins working at MgRonald's—a local fast-food restaurant.",
                             rating: 5,
                             status: .toWatch)
        
        let fullMetal = Anime(title: "Full Metal Alchemist",
                              description: "The resurrection failed, leaving Edward without an arm and a leg and Alphonse's soul attached to a suit of armor. Now they roam around the country trying to find a way to restore their bodies with alchemy..",
                              rating: 5,
                              status: .toWatch)
        
        let captainTsubasa = Anime(title: "Captain Tsubasa", description: "Captain Tsubasa is the passionate story of an elementary school student whose thoughts and dreams revolve almost entirely around the love of soccer.", rating: 5, status: .toWatch)
        
        add(anime: saikiKusuo)
        add(anime: melancoly)
        add(anime: steins)
        add(anime: hunter)
        add(anime: kuroko)
        add(anime: punch)
        add(anime: avatar)
        add(anime: maouSama)
        add(anime: fullMetal)
        add(anime: captainTsubasa)
    }

    func add(anime: Anime) -> Bool {
        let status: ()? = try? realm.write {
            realm.add(anime.encode())
        }
        return status == nil
    }

    func getAnimes(_ status: AnimeStatusType) -> [Anime] {
        let statusString = status.rawValue
        let animes = realm
            .objects(RealmAnime.self)
            .filter("status == %@", (statusString))

        return Array(animes.map { $0.decode() })
    }
}
