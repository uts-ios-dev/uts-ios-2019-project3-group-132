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
    let assignmentId: String
    let name: String
    let subject: String
    
    //MARK: Variables
    var skills: Array<String> = Array<String>()
    var students: Array<Student> = Array<Student>()
    
    //MARK: Initialisers
    init(assignmentId: String, name: String, subject: String) {
        self.assignmentId = assignmentId
        self.name = name
        self.subject = subject
    }
}
