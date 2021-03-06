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
    let groupId: String
    let name: String
    let subjectId: String //Subject this group is apart of
    let maxGroupSize: Int
    
    // MARK: Variables/ Properties
    var members: Array<Student> = Array<Student>() //a list of the students in this group
    var assignment: Assignment = Assignment(assignmentId: "", name: "", subject: "") //Assignment this group is apart of
    
    var isGroupFull: Bool {
        return members.count == maxGroupSize
    }
    
    var size: Int {
        return members.count
    }
    
    // MARK: Initialisers
    init(groupId: String, name: String, subjectId: String, groupSize: Int, member: Student) {
        self.groupId = groupId
        self.name = name
        self.subjectId = subjectId
        self.maxGroupSize = groupSize
        self.addGroupMember(student: member)
    }
    
    init(groupId: String, name: String, subjectId: String, assignment: Assignment, groupSize: Int, member: Student) {
        self.groupId = groupId
        self.name = name
        self.subjectId = subjectId
        self.assignment = assignment
        self.maxGroupSize = groupSize
        self.addGroupMember(student: member)
    }
    
    init(groupId: String, name: String, subjectId: String, assignment: Assignment, groupSize: Int, members: Array<Student>) {
        self.groupId = groupId
        self.name = name
        self.subjectId = subjectId
        self.assignment = assignment
        self.maxGroupSize = groupSize
        self.members = members
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
