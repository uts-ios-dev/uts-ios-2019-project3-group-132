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
    let fullName: String
    let preferredName: String
    let studentId: String
    
    // MARK: Variables
    var skills: Array<String> = Array<String>()
    var interests: Array<String> = Array<String>()
    var groups: Array<Group> = Array<Group>()
    
    // MARK: Initialisers
    init(fullName: String, preferredName:String, studentId: String) {
        self.fullName = fullName
        self.preferredName = preferredName
        self.studentId = studentId
    }
    
    //MARK: Functions
    func addGroup(groupToAdd group: Group) {
        groups.append(group)
    }
}
