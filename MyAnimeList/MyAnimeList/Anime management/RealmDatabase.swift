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
    }

    func add(anime: Anime) -> Bool {
        let status: ()? = try? realm.write {
            realm.add(anime.encode())
        }
        return status != nil
    }

    func getAnimes(_ status: AnimeStatusType) -> [Anime] {
        let statusString = status.rawValue
        let animes = realm
            .objects(RealmAnime.self)
            .filter("status == %@", (statusString))

        return Array(animes.map { $0.decode() })
    }
}
