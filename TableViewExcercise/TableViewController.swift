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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        tableView.allowsSelectionDuringEditing = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tableView.beginUpdates()
            
            for (index, sectionItems) in allHeroesRoles.enumerated() {
                let indexPath = IndexPath(row: sectionItems.count, section: index)
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
            tableView.endUpdates()
            tableView.setEditing(true, animated: true)
        } else {
            tableView.beginUpdates()
            
            for (index, sectionItems) in allHeroesRoles.enumerated() {
                let indexPath = IndexPath(row: sectionItems.count, section: index)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            tableView.endUpdates()
            tableView.setEditing(false, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allHeroesRoles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let addedRow = isEditing ? 1 : 0
        
        return allHeroesRoles[section].count + addedRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row >= allHeroesRoles[indexPath.section].count && isEditing {
            cell.textLabel?.text = "Add New Hero"
            cell.detailTextLabel?.text = nil
            cell.imageView?.image = nil
        } else {
            let item = allHeroesRoles[indexPath.section][indexPath.row]
            
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.occupation
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let role = Heroes.Role(rawValue: section) else {
            print("Invalid section number \(section) to generate a valid role")
            return "Invalid roll"
        }
        
        switch role {
        case .offense:
            return "Offense"
        case .defense:
            return "Defense"
        case .tank:
            return "Tank"
        case .support:
            return "Support"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            allHeroesRoles[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            let section = indexPath.section
            
            guard let role = Heroes.Role(rawValue: section) else {
                print("Invalid section number \(section) to generate a valid role")
                return
            }
            
            var newHeroName = "Hero Name"
            var newOccupation = "Hero Occupation"
            
            switch role {
            case .offense:
                newHeroName = "New Hero Offense"
                newOccupation = "New Occupation"
            case .defense:
                newHeroName = "New Hero Defense"
                newOccupation = "New Occupation"
            case .tank:
                newHeroName = "New Hero Tank"
                newOccupation = "New Occupation"
            case .support:
                newHeroName = "New Hero Support"
                newOccupation = "New Occupation"
            }
            
            let newHero = Heroes(name: newHeroName, occupation: newOccupation, role: role)
            allHeroesRoles[indexPath.section].append(newHero)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let sectionItems = allHeroesRoles[indexPath.section]
        if indexPath.row >= sectionItems.count {
            return .insert
        } else {
            return .delete
        }
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let sectionItems = allHeroesRoles[indexPath.section]
        if isEditing && indexPath.row < sectionItems.count {
            return nil
        }
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sectionItems = allHeroesRoles[indexPath.section]
        if indexPath.row >= sectionItems.count && isEditing {
            self.tableView(tableView, commit: .insert, forRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let sectionItems = allHeroesRoles[indexPath.section]
        if indexPath.row >= sectionItems.count && isEditing {
            return false
        }
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = allHeroesRoles[sourceIndexPath.section][sourceIndexPath.row]
        
        allHeroesRoles[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        
        if sourceIndexPath.section == destinationIndexPath.section {
            // same section
            allHeroesRoles[sourceIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
        } else {
            allHeroesRoles[destinationIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        let sectionItems = allHeroesRoles[proposedDestinationIndexPath.section]
        
        if proposedDestinationIndexPath.row >= sectionItems.count  {
            return IndexPath(row: sectionItems.count - 1, section: proposedDestinationIndexPath.section)
        }
        return proposedDestinationIndexPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

