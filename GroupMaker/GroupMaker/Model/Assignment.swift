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
    var skills: Array<Skill> = Array<Skill>() //an assignment has a list of skills as its skill set
    var students: Array<Student> = Array<Student>() // an assignment has a list of students who is taking this assignment
    
    //MARK: Initialisers
    init(assignmentId: String, name: String, subject: String) {
        self.assignmentId = assignmentId
        self.name = name
        self.subject = subject
    }
    
    init(assignmentId: String, name: String, subject: String, students: Array<Student>){
        self.assignmentId = assignmentId
        self.name = name
        self.subject = subject
        self.students = students
    }
    
    init(assignmentId: String, name: String, subject: String, students: Array<Student>, skills: Array<Skill>){
        self.assignmentId = assignmentId
        self.name = name
        self.subject = subject
        self.students = students
        self.skills = skills
    }
}
