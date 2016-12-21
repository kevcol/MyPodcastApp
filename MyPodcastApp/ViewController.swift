//
//  ViewController.swift
//  MyPodcastApp
//
//  Created by Kevin Colligan on 12/21/16.
//  Copyright © 2016 Kevin Colligan. All rights reserved.
//

import UIKit
import waterwheel
import ObjectMapper

// Copied over the frontpageviewcontent struct from demo example - will have to modify to reflect actual content model
public struct FrontpageViewContent: Mappable {
    var title: String?
    var body:  String?
    var contentType: String?
    var date: String?
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        title     <- map["title"]
        body  <- map["body"]
        contentType <- map["type"]
        date <- map["created"]
    }
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // temporary array of titles; will be served by waterwheel once I figure it out
    let cellContent = ["The Red Hurricane", "The Hard Way", "Death's A Bitch", "The David"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // temporarily using array count; will change to view count when I figure out how to access
        return cellContent.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        // stumped on what to put here; going with array data for now
        cell.textLabel?.text = cellContent[indexPath.row]
        
    
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


