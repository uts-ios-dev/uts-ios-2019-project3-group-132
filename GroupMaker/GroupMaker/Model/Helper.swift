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
    
    //Skill caculator is to calculate a student's total skill points in an assignment
    func skillCalculator (student: Student, assignment: Assignment) {
        student.totalPoints = 0
        for i in 0..<student.skills.count {
            
            for j in 0..<assignment.skills.count {
                //when a student has a skill in the assignment's skill set, then add the skill's assignment point to the student's total points
                if (student.skills[i].skillId == assignment.skills[j].skillId) {
                    student.totalPoints += assignment.skills[j].skillPoint
                }
            }
        }
    }
    
    func skillSort (students: Array<Student>) -> Array<Student> {
            return students.sorted(by: { $0.totalPoints > $1.totalPoints })
    }
    
    
    
    //ExpectationSort is for putting together the students with same expected mark
    func expectationSort(students: Array<Student>) -> Array<Student> {
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
        
        return studentArray
    }
    
    static func getGroups() -> Array<Group> {
        return [
            Group(groupId: "1", name: "iOS Assignment 1", subjectId: "1", assignment: Helper.getAssignments()[0], groupSize: 3, members: [Helper.getStudents()[0], Helper.getStudents()[1]]),
            Group(groupId: "2", name: "iOS Assignment 2", subjectId: "1", assignment: Helper.getAssignments()[1], groupSize: 4, members: [Helper.getStudents()[0], Helper.getStudents()[3], Helper.getStudents()[4]])
        ]
    }
    
    static func getInvites() -> Array<Invitation> {
        return [
            Invitation(invitationId: "1", group: Group(groupId: "3", name: "iOS Assignment 3", subjectId: "1", assignment: Helper.getAssignments()[0], groupSize: 5, member: Helper.getStudents()[1]), studentId: "1", inviteeName: Helper.getStudents()[1].preferredName),
            Invitation(invitationId: "2", group: Group(groupId: "4", name: "L & Routers 1", subjectId: "4", assignment: Helper.getAssignments()[2], groupSize: 2, member: Helper.getStudents()[2]), studentId: "12345678", inviteeName: Helper.getStudents()[2].preferredName)
        ]
    }
    
    static func getAssignments() -> Array<Assignment> {
        return [
            Assignment(assignmentId: "1", name: "iOS: Assignment 1", subject: "iOS Application Development", students: getStudents(), skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 10), Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5)]),
            Assignment(assignmentId: "2", name: "iOS: Assignment 2", subject: "iOS Application Development", students: getStudents(), skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 10), Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5), Skill(skillId: "10003", skillName: "Project Management", skillPoint: 15), Skill(skillId: "10004", skillName: "Graphic design", skillPoint: 5)]),
            Assignment(assignmentId: "4", name: "L & R: Assignment 1", subject: "Lans and Routing", students: getStudents(), skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 2), Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5), Skill(skillId: "10003", skillName: "Project Management", skillPoint: 15), Skill(skillId: "10004", skillName: "Graphic design", skillPoint: 5)])
        ]
    }
    
    static func getAssignmentWithName(name: String) -> Assignment? {
        return Helper.getAssignments().first(where: {$0.name == name})
    }
    
    static func getGroupById(groupId: String) -> Group? {
        return Helper.getGroups().first(where: {$0.groupId == groupId})
    }
    
    static func getStudents() -> Array<Student> {
        return [
            Student(fullName: "Morgan Stark", preferredName: "Morgan", studentId: "10639437", assignmentExpectation: "HD", skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 10), Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5)]),
            Student(fullName: "Peter Smith", preferredName: "Pete", studentId: "12345678", assignmentExpectation: "C",  skills: [Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5)]),
            Student(fullName: "Gloria Han", preferredName: "Gloria", studentId: "87654321", assignmentExpectation: "D",  skills: [Skill(skillId: "10003", skillName: "Project Management", skillPoint: 15), Skill(skillId: "10001", skillName: "Graphic design", skillPoint: 5)]),
            Student(fullName: "Henry Wann", preferredName: "Hen Hen", studentId: "51235671", assignmentExpectation: "P",  skills: [Skill(skillId: "10004", skillName: "Graphic design", skillPoint: 5)]),
            Student(fullName: "Leonard Cass", preferredName: "Cass", studentId: "64321577", assignmentExpectation: "C",  skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 10), Skill(skillId: "10004", skillName: "Graphic design", skillPoint: 5)]),
            Student(fullName: "Alex Lee", preferredName: "Alex", studentId: "12121212", assignmentExpectation: "HD",  skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 10), Skill(skillId: "10005", skillName: "Reporting writing", skillPoint: 10)]),
            Student(fullName: "Clare Jackman", preferredName: "Clare", studentId: "12030405", assignmentExpectation: "D",  skills: [Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5), Skill(skillId: "10003", skillName: "Project Management", skillPoint: 15)]),
            Student(fullName: "Joris Donald", preferredName: "Jo", studentId: "12030599", assignmentExpectation: "C",  skills: [Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5)]),
            Student(fullName: "Lara Thomas", preferredName: "Lara", studentId: "90030405", assignmentExpectation: "C",  skills: [Skill(skillId: "10003", skillName: "Project Management", skillPoint: 15)])
        ]
    }
}

