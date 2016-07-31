//
//  ViewController.swift
//  FoodPinTableSelection
//
//  Created by Psychesnet on 7/31/16.
//  Copyright © 2016 Psychesnet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster",
                           "For Kee", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate",
                           "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats and Deli",
                           "Waffle & Wolf", "Five", "Cafe Lore", "Confessional", "Barrafina", "Donostia",
                           "Donostia", "Royal Oak", "Cask Pub and Kitchen"]
    var likeRestaurant = [Bool](count: 21, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = "Taiwan"
        cell.thumbnailImageView?.image = UIImage(named: "IMG_2423")
        cell.thumbnailImageView?.layer.cornerRadius = 30
        cell.thumbnailImageView?.clipsToBounds = true
        return cell
    }
    
    /*
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // way 1
        if editingStyle == .Delete {
            restaurantNames.removeAtIndex(indexPath.row)
        }
        //tableView.reloadData()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    */
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // way 2
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: {
            (action, indexPath) -> Void in
                let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
                let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
        })
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {
            (action, indexPath) -> Void in
                self.restaurantNames.removeAtIndex(indexPath.row)
                self.likeRestaurant.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        let actionWord = self.likeRestaurant[indexPath.row] ? "Unlike" : "Like"
        let likeAction = UITableViewRowAction(style: .Default,
            title: actionWord,
            handler: {
            (action, indexPath) -> Void in
                let cellIdentifier = "Cell"
                let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
                print("index \(indexPath.row) \(self.likeRestaurant[indexPath.row])")
                if self.likeRestaurant[indexPath.row] {
                    cell.accessoryType = .None
                    self.likeRestaurant[indexPath.row] = false
                } else {
                    cell.accessoryType = .Checkmark
                    self.likeRestaurant[indexPath.row] = true
                }
                tableView.reloadData()
        })
        likeAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction, likeAction]
    }
}

