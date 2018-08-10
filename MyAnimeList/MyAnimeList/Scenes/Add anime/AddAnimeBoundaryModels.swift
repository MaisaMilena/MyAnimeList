//
//  AddAnimeBoundaryModels.swift
//  MyAnimeList
//
//  Created by Maisa on 09/08/18.
//  Copyright (c) 2018 Maisa Milena. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct AddAnime {
    struct Request {
        
    }
    struct Response {
        struct Anime {
            var name: String
            var description: String
            var rating: Int
            var status: StatusAnime
            
            enum StatusAnime {
                case watched, toWatch
            }
        }
        
        var animes: [Anime]
        
        struct ViewModel {
            struct ItemViewModel {
                let identifier: Int
                let preparedName: String?
                let preparedImage: UIImage?
            }
            var itemsViewModel: [ItemViewModel]
        }
    }
}
