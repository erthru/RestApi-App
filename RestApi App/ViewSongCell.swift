//
//  ViewSongCell.swift
//  RestApi App
//
//  Created by Suprianto Djamalu on 19/03/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit

class ViewSongCell: UITableViewCell {

    @IBOutlet weak var lbTitle:UILabel!
    @IBOutlet weak var lbArtist:UILabel!
    
    var song:Song!
    
    func setData(_ song:Song){
        self.song = song
        
        lbTitle.text = song.title
        lbArtist.text = song.artist
        
    }
    
}
