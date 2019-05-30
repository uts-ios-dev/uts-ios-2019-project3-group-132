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
            switch studentArray[index].assignmentExpectation {
            case "HD":
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            case "D":
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            case "C":
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            case "P":
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            default:
                break
            }
        }
    }
}

