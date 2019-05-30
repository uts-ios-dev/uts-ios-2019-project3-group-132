//
//  PeopleViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func expectationSort() {
        //Hard Code for a list of students
        var studentArray: Array<Student> = Array<Student>()
        let student_1 = Student(fullName: "aaa", preferredName: "aaaa", studentId: "1")
        student_1.assignmentExpectation = "P"
        studentArray.append(student_1)
        
        let student_2 = Student(fullName: "bbb", preferredName: "bbbb", studentId: "2")
        student_2.assignmentExpectation = "D"
        studentArray.append(student_2)
        
        let student_3 = Student(fullName: "ccc", preferredName: "cccc", studentId: "3")
        student_3.assignmentExpectation = "C"
        studentArray.append(student_3)
        
        let student_4 = Student(fullName: "ddd", preferredName: "dddd", studentId: "4")
        student_4.assignmentExpectation = "HD"
        studentArray.append(student_4)
        
        let student_5 = Student(fullName: "eee", preferredName: "eeee", studentId: "5")
        student_5.assignmentExpectation = "HD"
        studentArray.append(student_5)
        
        let student_6 = Student(fullName: "fff", preferredName: "ffff", studentId: "6")
        student_1.assignmentExpectation = "C"
        studentArray.append(student_6)
        
        let student_7 = Student(fullName: "ggg", preferredName: "gggg", studentId: "7")
        student_7.assignmentExpectation = "D"
        studentArray.append(student_7)
        
        let student_8 = Student(fullName: "hhh", preferredName: "hhhh", studentId: "8")
        student_1.assignmentExpectation = "P"
        studentArray.append(student_8)
        
        //Get "HD"s together
        for index in 0...studentArray.count - 1{
            if studentArray[index].assignmentExpectation == "HD" {
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
        //Get "D"s together
        for index in 0...studentArray.count - 1{
            if studentArray[index].assignmentExpectation == "D" {
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
        //Get "C"s together
        for index in 0...studentArray.count - 1{
            if studentArray[index].assignmentExpectation == "C" {
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
        //Get "P"s together
        for index in 0...studentArray.count - 1{
            if studentArray[index].assignmentExpectation == "P" {
                studentArray.append(studentArray[index])
                studentArray.remove(at: index)
            }
        }
        
     }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
