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

// Copied struct from demo example - will have to modify to reflect actual content model, will just display title for now
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
    // let cellContent = ["The Red Hurricane", "The Hard Way", "Death's A Bitch", "The David"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // temporarily using array count; will change to view count when I figure out how to access
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        // thoroughly confused how to get content into the cell ... but I am making it through to Drupal cuz changing view path gives me a watchdog 404
        // "frontpaje" path, btw, is path for a REST export I made based on frontpage View, to expose JSON. seems to work fine (is there a better way to expose?)
        
        print("hit da Drupal")
        
        let frontpageTableVC = waterwheelViewTableViewController(viewPath: "frontpaje", configure: { (cell: ExampleCell, responseRow: FrontpageViewContent) in
            cell.textLabel?.text = responseRow.title
            cell.detailTextLabel?.text = responseRow.contentType
        })

    
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

final class ExampleCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




