//
//  Student.swift
//  GroupMaker
//
//  Created by Callum Crossley on 28/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Student {
    
    // MARK: Constants
    let firstName: String
    let lastName: String
    let studentId: String
    
    // MARK: Variables
    var skills: Array<String> = Array<String>()
    var interests: Array<String> = Array<String>()
    var groups: Array<Group> = Array<Group>()
    
    // MARK: Initialisers
    init(firstName: String, lastName:String, studentId: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.studentId = studentId
    }
    
    //MARK: Functions
    func addGroup(groupToAdd group: Group) {
        groups.append(group)
    }
}
