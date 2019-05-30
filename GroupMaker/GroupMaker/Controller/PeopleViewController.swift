//
//  PeopleViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    

    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
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
    */
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
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
