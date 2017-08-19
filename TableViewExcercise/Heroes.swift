//
//  Heroes.swift
//  TableViewExcercise
//
//  Created by Samuel Hardy on 8/18/17.
//  Copyright © 2017 Samuel Hardy. All rights reserved.
//

import Foundation

struct Heroes {
    
    enum Role: Int {
        case offense = 0
        case defense = 1
        case tank = 2
        case support = 3
    }
    
    let name: String
    let occupation: String
    let role: Role
}
