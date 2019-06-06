//
//  Student.swift
//  GroupMaker
//
//  Created by Callum Crossley on 28/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Student {
    
    // MARK: Variables
    var fullName: String
    var preferredName: String
    var studentId: String
    var skills: Array<Skill> = Array<Skill>() //a student has a list of skills to contribute to the group when working on the assignment
    var totalPoints: Int //the total points is caculated from student's skill set in an assignment, calculation func is in Helper class
    var assignmentExpectation: String //the student's expectation on the group result for this assginment, HD / D / C / P
    var interests: Array<String> = Array<String>()
    var groups: Array<Group> = Array<Group>()
    
    // MARK: Initialisers
    init(fullName: String, preferredName:String, studentId: String, assignmentExpectation: String,skills: [Skill]) {
        self.fullName = fullName
        self.preferredName = preferredName
        self.studentId = studentId
        self.totalPoints = 0 //by default the student rates 0 points in an assignment
        self.assignmentExpectation = assignmentExpectation //by default the student's expectation is Passs in an assignment
        self.skills = skills
    }
    
    //MARK: Functions
    func addGroup(groupToAdd group: Group) {
        groups.append(group)
    }
}
