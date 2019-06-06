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
            helper.expectationSort(students: listStudents)// sort by expectation
            
            //caculate skill total points for each student
            for i in 0..<listStudents.count {
                helper.skillCalculator(student: listStudents[i], assignment: group.assignment)
            }
            
            //sort the student list by skill points
            helper.skillSort(students: listStudents)
            
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
            
            cellToReturn = cell
        }
        
        return cellToReturn
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        self.performSegue(withIdentifier: "showProfileSegue", sender: self)
    }
    
    func inviteButtonPressed(_ sender: UIButton) {
        if let indexPath = getCurrentCellIndexPath(sender){
            // Get the current invite
            let student = listStudents[indexPath.row]
            
            // Create invitiation for student
            let newInvitation = Invitation(invitationId: "4", group: currentGroup!, studentId: student.studentId, inviteeName: Helper.getStudents()[0].fullName)
            
            //sender.currentTitle
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
