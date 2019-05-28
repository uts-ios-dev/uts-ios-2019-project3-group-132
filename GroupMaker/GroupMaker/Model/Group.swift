//
//  Group.swift
//  GroupMaker
//
//  Created by Callum Crossley on 28/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Group {
    
    // MARK: Constants
    let name: String
    let subject: String //Subject this group is apart of
    let assignment: Assignment //Assignment this group is apart of
    let maxGroupSize: Int
    
    // MARK: Variables/ Properties
    var members: Array<Student> = Array<Student>() //Current group members
    
    var isGroupFull: Bool {
        return members.count == maxGroupSize
    }
    
    // MARK: Initialisers
    init(name: String, subject: String, assignment: Assignment, groupSize: Int) {
        self.name = name
        self.subject = subject
        self.assignment = assignment
        self.maxGroupSize = groupSize
    }
    
    // MARK: Functions
    func addGroupMember(student: Student) {
        if (!isGroupFull) {
            members.append(student)
        }
    }
    
    func toString() -> String {
        return "Group: \(name). No. Members: \(members.count). Currently full: \(isGroupFull)"
    }
}
