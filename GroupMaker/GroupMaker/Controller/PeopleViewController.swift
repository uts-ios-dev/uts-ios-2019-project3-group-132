//
//  PeopleViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

protocol PeopleCellDelegate: class {
    func inviteButtonPressed(_ sender: UIButton)
}

class PeopleCustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var inviteBtn: UIButton!
    @IBOutlet weak var expectationLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    weak var delegate: PeopleCellDelegate?
    @IBAction func inviteBtnPressed(_ sender: UIButton) {
        delegate?.inviteButtonPressed(sender)
    }
}

class PeopleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PeopleCellDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var peopleTableView: UITableView!
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //Current assignment list it's showing
    var currentGroup: Group? = nil
    var listStudents: Array<Student> = Array<Student>()
    var helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        peopleTableView.dataSource = self
        peopleTableView.delegate = self
        
        if let group = currentGroup {
            listStudents = group.assignment.students
            //Remove students that are already in the group
            listStudents = listStudents.filter{ !group.members.map{$0.studentId}.contains($0.studentId) }
            //Do sorting/ removal of students based on algo here
            listStudents = helper.expectationSort(students: listStudents)// sort by expectation
            
            //Caclulate skill total points for each student
            for i in 0..<listStudents.count {
                helper.skillCalculator(student: listStudents[i], assignment: group.assignment)
            }
            
            //sort the student list by skill points
            listStudents = helper.skillSort(students: listStudents)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
        if tableView == peopleTableView {
            let cell = peopleTableView.dequeueReusableCell(withIdentifier: "cellPerson", for: indexPath) as! PeopleCustomCell
            
            let student = listStudents[indexPath.row]
            cell.nameLbl.text = "\(indexPath.row + 1): \(student.preferredName)"
            cell.delegate = self
            cell.expectationLbl.text = "Expectation: \(student.assignmentExpectation)"
            cell.scoreLbl.text = "Skill Score: \(student.totalPoints)"
            
            cellToReturn = cell
        }
        
        return cellToReturn
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        self.performSegue(withIdentifier: "showProfileSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77.0
    }
    
    func inviteButtonPressed(_ sender: UIButton) {
        if let indexPath = getCurrentCellIndexPath(sender){
            // Get the current student
            let student = listStudents[indexPath.row]
            
            // Button changes to indicate invite
            sender.setTitle("Invited", for: .normal)
            sender.isEnabled = false
            sender.setTitleColor(UIColor.blue, for: .normal)
        }
        
    }
    
    func getCurrentCellIndexPath(_ sender: UIButton) -> IndexPath? {
        let buttonPosition = sender.convert(CGPoint.zero, to: peopleTableView)
        if let indexPath: IndexPath = peopleTableView.indexPathForRow(at: buttonPosition) {
            return indexPath
        }
        
        peopleTableView.indexPath
        return nil
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showProfileSegue")
        {
            let upcoming: ProfileViewController = segue.destination as! ProfileViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.peopleTableView.indexPathForSelectedRow
            // Group is set to the title at the row in the objects array.
            let selectedPerson = self.listStudents[(indexPath?.row)!]
            upcoming.currentProfile = selectedPerson
            self.peopleTableView.deselectRow(at: indexPath!, animated: true)
        }
    }

}
