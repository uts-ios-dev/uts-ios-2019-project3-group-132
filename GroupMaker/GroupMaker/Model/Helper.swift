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
    func SkillCalculator (student: Student, assignment: Assignment) {
        for i in 0..<student.skills.count {
            
            for j in 0..<assignment.skills.count {
                //when a student has a skill in the assignment's skill set, then add the skill's assignment point to the student's total points
                if (student.skills[i].skillId == assignment.skills[j].skillId) {
                    student.totalPoints += assignment.skills[j].skillPoint
                }
            }
        }
    }
}

