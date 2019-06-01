//
//  Helper.swift
//  GroupMaker
//
//  Created by Jason JIANG on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

//Helper class is to store all functions that can be used globally
class Helper {
    
    //Skill caculator is to calculate a student's totoal skill points in an assignment
    func skillCalculator (student: Student, assignment: Assignment) {
        for i in 0..<student.skills.count {
            
            for j in 0..<assignment.skills.count {
                //when a student has a skill in the assignment's skill set, then add the skill's assignment point to the student's total points
                if (student.skills[i].skillId == assignment.skills[j].skillId) {
                    student.totalPoints += assignment.skills[j].skillPoint
                }
            }
        }
    }
    
    //ExpectationSort is for putting together the students with same expected mark
    func expectationSort(students: Array<Student>) {
        var studentArray = students
        //Get students of each expectation together
        for index in 0...studentArray.count - 1 {
            if studentArray[index].assignmentExpectation == "HD"{
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
        for index in 0...studentArray.count - 1 {
            if studentArray[index].assignmentExpectation == "D"{
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
        for index in 0...studentArray.count - 1 {
            if studentArray[index].assignmentExpectation == "C"{
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
        for index in 0...studentArray.count - 1 {
            if studentArray[index].assignmentExpectation == "P"{
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
    }
    
    static func getGroups() -> Array<Group> {
        
        
        return [
            Group(groupId: "1", name: "Da Best Group", subjectId: "1", assignment: Helper.getAssignments()[0], groupSize: 3, members: [Helper.getStudents()[0], Helper.getStudents()[1]]),
            Group(groupId: "2", name: "iOS Assignment 2", subjectId: "1", assignment: Helper.getAssignments()[1], groupSize: 3, members: [Helper.getStudents()[0], Helper.getStudents()[1], Helper.getStudents()[2]])
        ]
    }
    
    static func getAssignments() -> Array<Assignment> {
        return [
            Assignment(assignmentId: "1", name: "iOS: Assignment 1", subject: "iOS Application Development"),
            Assignment(assignmentId: "2", name: "iOS: Assignment 2", subject: "iOS Application Development"),
            Assignment(assignmentId: "3", name: "ITOM: Assignment 1", subject: "ITOM")
        ]
    }
    
    static func getAssignmentWithName(name: String) -> Assignment? {
        return Helper.getAssignments().first(where: {$0.name == name})
    }
    
    static func getStudents() -> Array<Student> {
        return [
            Student(fullName: "Morgan Stark", preferredName: "Morgan", studentId: "10639437"),
            Student(fullName: "Peter Smith", preferredName: "Pete", studentId: "12345678"),
            Student(fullName: "Gloria Han", preferredName: "Gloria", studentId: "87654321"),
            Student(fullName: "Henry Wann", preferredName: "Hen Hen", studentId: "51235671"),
            Student(fullName: "Leonard Cass", preferredName: "Cass", studentId: "64321577")
        ]
    }
}

