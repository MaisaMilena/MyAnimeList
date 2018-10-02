//
//  Anime+Realm.swift
//  MyAnimeList
//
//  Created by Francesco Perrotti Garcia on 10/2/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import Foundation
import RealmSwift

class RealmAnime: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var animeDescription: String = ""
    @objc dynamic var rating: Int = 0
    @objc dynamic var status: String = "none"
}

extension RealmAnime: RealmDecodable {
    func decode() -> Anime {
        let status = AnimeStatusType(rawValue: self.status) ?? .none

        return Anime(title: title,
                     description: animeDescription,
                     rating: rating,
                     status: status)
    }
}

extension Anime: RealmEncodable {
    func encode() -> RealmAnime {
        let anime = RealmAnime()
        anime.title = title
        anime.animeDescription = description
        anime.rating = rating
        anime.status = status.rawValue

        return anime
    }
}
