//
//  AppDelegate+DatabaseMigration.swift
//  MyAnimeList
//
//  Created by Francesco Perrotti Garcia on 10/2/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import Foundation
import RealmSwift

private var migratedInMemoryToRealm: Bool {
    get {
        return UserDefaults.standard.bool(forKey: "migratedInMemoryToRealm")
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "migratedInMemoryToRealm")
    }
}

func migrateDatabaseIfNeeded() {
    guard !migratedInMemoryToRealm else { return }
    guard let realm = try? Realm() else { return }
    defer { migratedInMemoryToRealm = true }

    let inMemory = InMemoryAnimeDatabase.instance
    let statuses: [AnimeStatusType] = [.toWatch, .watched, .none]
    let allAnime = statuses.flatMap { inMemory.getAnimes($0) }

    let realmDatabase = RealmDatabase(realm: realm)
    allAnime.forEach { _ = realmDatabase.add(anime: $0) }
}
