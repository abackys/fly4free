//
//  ViewController.swift
//  Fly4Free
//
//  Created by MacBook on 7/11/15.
//  Copyright (c) 2015 opendev. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var items: NSArray! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://arcane-atoll-4723.herokuapp.com/items").responseItems { ( items, error) in
            self.items = items;
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : ItemCell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell;
        
        cell.request?.cancel()
        
        
        let item : Item = self.items[indexPath.row] as! Item
        
        cell.titleLabel.text = item.title;
        
        let imgURL = item.imgUrl
        
        cell.request = Alamofire.request(.GET, item.imgUrl).responseImage() {
            (request, _, image, error) in
            if error == nil && image != nil {
                cell.thubnailImageView.image = image
            }
        }
        
        return cell;
        
    }


}

