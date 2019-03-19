//
//  ViewController.swift
//  RestApi App
//
//  Created by Suprianto Djamalu on 19/03/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableSong:UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableSong.dataSource = self
        self.tableSong.delegate = self
        
        loadData()
        
    }
    
    private func loadData(){
        
        AF.request("http://192.168.56.1/anows/ios/app.php").responseJSON{ response in
            
            let json = JSON(response.result.value!)
            
            for i in 0 ..< json["data"].count{
                
                let title = json["data"][i]["title"].string!
                let artist = json["data"][i]["artist"].string!
                
                self.songs.append(Song(title,artist))
                
            }
            
            self.tableSong.reloadData()
            
        }
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewSongCell") as! ViewSongCell
        
        cell.setData(song)
        
        return cell
        
    }
    
    
}

