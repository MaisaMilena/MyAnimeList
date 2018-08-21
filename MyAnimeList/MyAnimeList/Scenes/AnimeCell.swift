//
//  AnimeCell.swift
//  MyAnimeList
//
//  Created by Maisa on 20/08/18.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit

class AnimeCell: UITableViewCell {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var animeDescription: UITextView!
    @IBOutlet weak var ratingScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("🐮 awake from Nib da AnimeCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
