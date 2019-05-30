//
//  Student.swift
//  GroupMaker
//
//  Created by Callum Crossley on 28/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Student {
    
    // MARK: Constant
    let fullName: String
    let preferredName: String
    let studentId: String
    
    // MARK: Variables
    var skills: Array<String> = Array<String>()
    var totalPoints: Int //the total points is caculated from student's skill set in an assignment, calculation func is in Helper class
    var assignmentExpertation: String
    var interests: Array<String> = Array<String>()
    var groups: Array<Group> = Array<Group>()
    
    // MARK: Initialisers
    init(fullName: String, preferredName:String, studentId: String) {
        self.fullName = fullName
        self.preferredName = preferredName
        self.studentId = studentId
        self.totalPoints = 0 //by default the student rates 0 points in an assignment
        self.assignmentExpertation = "P" //by default the student's expectataion is Passs in an assignment
    }
    
    //MARK: Functions
    func addGroup(groupToAdd group: Group) {
        groups.append(group)
    }
}
