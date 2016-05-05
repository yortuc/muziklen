//
//  ArtistsListDataProvider.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class ArtistsListDataProvider: NSObject, ListDataProvider {

    private let cellIdentifier = "Cell"
    
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
}
