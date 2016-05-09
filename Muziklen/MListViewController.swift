//
//  MListViewController.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class MListViewController: UITableViewController {

    var dataProvider: ListDataProvider?
    
    override func viewDidLoad() {
        
        // setup data source for tableView
        tableView.dataSource = self.dataProvider
        self.dataProvider?.registerCellsForTableView(tableView)
        
        // add button
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addItem(){
        let dp = self.dataProvider as! ArtistsListDataProvider
        
        let artist = Artist(name: "Muser", tags:["rock", "alternative"], info: "best rock band evet", followersCount: 14, albums: [])
        
        dp.addArtist(artist)
        tableView.reloadData()
    }
}
