//
//  ColorViewController.swift
//  SplitViewController_2
//
//  Created by Salyards, Adey on 6/7/16.
//  Copyright © 2016 Salyards, Adey. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var color = Color(displayName: "Gray", color: UIColor.grayColor())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(color.displayName) Color"
        view.backgroundColor = color.color

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
