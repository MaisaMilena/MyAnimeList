//
//  Anime.swift
//  MyAnimeList
//
//  Created by Maisa on 10/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
 Defines the structure of an Anime object
 */
struct Anime {
    let title: String
    let description: String
    let rating: Int
    let status: AnimeStatusType
}

/**
 Defines the status of an anime.
 Can be: watched, toWatch or none (not relevant to know)
 */
enum AnimeStatusType: String {
    case watched, toWatch, none
}
