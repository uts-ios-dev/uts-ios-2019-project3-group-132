//
//  Assignment.swift
//  GroupMaker
//
//  Created by Callum Crossley on 28/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Assignment {
    
    //MARK: Constants
    let name: String
    let subject: String
    
    //MARK: Variables
    var skills: Array<String> = Array<String>()
    var students: Array<Student> = Array<Student>()
    
    //MARK: Initialisers
    init(name: String, subject: String) {
        self.name = name
        self.subject = subject
    }
}
