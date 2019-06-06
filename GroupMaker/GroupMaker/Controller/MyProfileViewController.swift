//
//  MyProfileViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var textFullName: UITextField!
    @IBOutlet weak var textPrefferedName: UITextField!
    @IBOutlet weak var textStudentId: UITextField!
    
    var currentStudent =  Student(fullName: "Morgan Stark", preferredName: "Morgan", studentId: "10639437", assignmentExpectation: "HD", skills: [Skill(skillId: "10001", skillName: "iOS programing", skillPoint: 10), Skill(skillId: "10002", skillName: "UI Design", skillPoint: 5)])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textFullName.text = currentStudent.fullName
        textPrefferedName.text = currentStudent.preferredName
        textStudentId.text = currentStudent.studentId
    }
    
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        currentStudent.fullName = textFullName.text!
        currentStudent.preferredName = textPrefferedName.text!
        currentStudent.studentId = textStudentId.text!
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
