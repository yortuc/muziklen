//
//  MListViewController.swift
//  Muziklen
//
//  Created by Evren Yortuçboylu on 05/05/16.
//  Copyright © 2016 Evren Yortuçboylu. All rights reserved.
//

import UIKit

class MListViewController<Item, Cell: UITableViewCell>: UITableViewController {

    var items: [Item]
    
    var configCell: (cell: Cell, item: Item)-> Cell
    
    var onItemSelected: (selectedItem: Item) -> Void
    
    var cellNib: String
    
    let cellIdentifier = "Cell"
    
    init(
        title: String,
        defaultItems: [Item],
        cellNib:String,
        onItemSelected: (selectedItem: Item) -> Void,
        configCell: (cell: Cell, item: Item)-> Cell
        )
    {
        self.items = defaultItems
        self.cellNib = cellNib
        self.configCell = configCell
        self.onItemSelected = onItemSelected
        
        super.init(style: .Plain)

        self.title = title
        self.tableView.reloadData()
    }
    
    func updateWith(items: [Item]) {
        self.items = items
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return App.UI.artistImageSize + CGFloat(2*8)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func viewDidLoad() {
        tableView.registerNib(UINib(nibName: cellNib, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.onItemSelected(selectedItem: self.items[indexPath.row])
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let item = self.items[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! Cell
        
        return self.configCell(cell: cell, item: item)
    }
}

extension MListViewController {
    func request(request: ApiRequest<Item>) {
        
    }
}

