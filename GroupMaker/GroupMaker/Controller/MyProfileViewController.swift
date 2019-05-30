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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var thisStudent = Student(fullName: "Morgan Stark", preferredName: "Morgan", studentId: "10639437")
        textFullName.text = thisStudent.fullName
        textPrefferedName.text = thisStudent.preferredName
        textStudentId.text = thisStudent.studentId
        
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
