//
//  OverwatchData.swift
//  TableViewExcercise
//
//  Created by Samuel Hardy on 8/18/17.
//  Copyright © 2017 Samuel Hardy. All rights reserved.
//

import Foundation

struct OverwatchHeroes {
    
    static var offense: [Heroes] = [
        Heroes(name: "Tracer", occupation: "Adventurer", role: .offense),
        Heroes(name: "Sombra", occupation: "Hacker", role: .offense),
        Heroes(name: "Soldier 76", occupation: "Vigilante", role: .offense),
        Heroes(name: "Reaper", occupation: "Mercenary", role: .offense),
        Heroes(name: "Pharah", occupation: "Security Chief", role: .offense),
        Heroes(name: "McCree", occupation: "Bounty Hunter", role: .offense),
        Heroes(name: "Genji", occupation: "Adventurer", role: .offense),
        Heroes(name: "Doomfist", occupation: "Mercenary", role: .offense)
    ]
    
    static var defense: [Heroes] = [
        Heroes(name: "Widowmaker", occupation: "Assassin", role: .defense),
        Heroes(name: "Torbjorn", occupation: "Weapons Designer", role: .defense),
        Heroes(name: "Mei", occupation: "Climatologist", role: .defense),
        Heroes(name: "Junkrat", occupation: "Anarchist", role: .defense),
        Heroes(name: "Hanzo", occupation: "Assassin", role: .defense),
        Heroes(name: "Bastion", occupation: "Battle Automation", role: .defense)
    ]
    
    static var tank: [Heroes] = [
        Heroes(name: "Zarya", occupation: "Soldier", role: .tank),
        Heroes(name: "Winston", occupation: "Scientist", role: .tank),
        Heroes(name: "Roadhog", occupation: "Body Guard", role: .tank),
        Heroes(name: "Reinhardt", occupation: "Adventurer", role: .tank),
        Heroes(name: "Orisa", occupation: "Guardian Robot", role: .tank),
        Heroes(name: "D.Va", occupation: "Mech Pilot", role: .tank)
    ]
    
    static var support: [Heroes] = [
        Heroes(name: "Zenyatta", occupation: "Wandering Guru", role: .support),
        Heroes(name: "Symmetra", occupation: "Architect", role: .support),
        Heroes(name: "Mercy", occupation: "Field Medic", role: .support),
        Heroes(name: "Lucio", occupation: "Freedom Fighter", role: .support),
        Heroes(name: "Ana", occupation: "Bounty Hunter", role: .support)
    ]
}
