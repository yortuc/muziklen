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
    
    var onItemSelected: ( (itemIndex: Int) -> Void )?
    
    var cellEditConfig: ((tableView: UITableView, indexPath: NSIndexPath) -> [UITableViewRowAction]?)?
        
    override func viewDidLoad() {
        
        // setup data source for tableView
        tableView.dataSource = self.dataProvider
        self.dataProvider?.registerCellsForTableView(tableView)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.dataProvider!.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let onSelected = self.onItemSelected {
            onSelected(itemIndex: indexPath.row)
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        if let cellEdit = self.cellEditConfig {
            return cellEdit(tableView: tableView, indexPath: indexPath)
        }
        else{
            return nil
        }
    }
}