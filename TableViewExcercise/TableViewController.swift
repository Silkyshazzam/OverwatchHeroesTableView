//
//  ViewController.swift
//  TableViewExcercise
//
//  Created by Samuel Hardy on 8/17/17.
//  Copyright © 2017 Samuel Hardy. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var allHeroesRoles: [[Heroes]] = [OverwatchHeroes.offense, OverwatchHeroes.defense, OverwatchHeroes.tank, OverwatchHeroes.support]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

