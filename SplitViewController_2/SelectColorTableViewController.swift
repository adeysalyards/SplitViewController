//
//  SelectColorTableViewController.swift
//  SplitViewController_2
//
//  Created by Salyards, Adey on 6/7/16.
//  Copyright © 2016 Salyards, Adey. All rights reserved.
//

import UIKit

struct Color {
    let displayName: String
    let color: UIColor
}

class SelectColorTableViewController: UITableViewController {
    
    private let colorCellIdentifier = "colorCell"
    
    var collapseDetailViewController: Bool = true

    private let colors = [
        Color(displayName: "Green", color: UIColor.greenColor()),
        Color(displayName: "Blue", color: UIColor.blueColor()),
        Color(displayName: "Yellow", color: UIColor.yellowColor()),
        Color(displayName: "Purple", color: UIColor.purpleColor()),
        Color(displayName: "Orange", color: UIColor.orangeColor()),
        Color(displayName: "Magenta", color: UIColor.magentaColor()),
        Color(displayName: "Brown", color: UIColor.brownColor()),
        Color(displayName: "Cyan", color: UIColor.cyanColor()),
        Color(displayName: "Red", color: UIColor.redColor()),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colors.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(colorCellIdentifier, forIndexPath: indexPath)

        let color = colors[indexPath.row]
        cell.textLabel?.text = color.displayName

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        collapseDetailViewController = false
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "colorSegue" {
            var colorViewController: ColorViewController!
            
            if let colorNavigationController = segue.destinationViewController as? UINavigationController {
                colorViewController = colorNavigationController.topViewController as? ColorViewController
                colorViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                colorViewController.navigationItem.leftItemsSupplementBackButton = true
            } else {
                colorViewController = segue.destinationViewController as! ColorViewController
            }; if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
                let color = colors[selectedRowIndexPath.row]
                colorViewController.color = color
            }
            
        }
        
    }

}
