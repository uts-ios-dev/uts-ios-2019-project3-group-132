//
//  GroupViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlet
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var assignmentLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var addMemberBtn: UIButton!
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var maxGroupSizeLbl: UILabel!
    
    //MARK: Action
    @IBAction func addBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showPeopleSegue", sender: self)
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Variables
    var currentGroup: Group? = nil
    
    
    // MARK: Initialisers
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        memberTableView.dataSource = self
        memberTableView.delegate = self
        
        if let group = currentGroup {
            titleLbl.text = group.name
            subjectLbl.text = "Subject Id: \(group.subjectId)"
            assignmentLbl.text = "Assignment: \(group.assignment.name)"
            maxGroupSizeLbl.text = "Max Group Size: \(group.maxGroupSize)"
            
            // Disable button if the group has max number of members
            if (group.isGroupFull) {
                addMemberBtn.isEnabled = false
            }
        }
    }
    
    // MARK: TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroup?.members.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberTableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        
        let member = currentGroup?.members[indexPath.row]
        cell.textLabel?.text = member?.preferredName
        cell.detailTextLabel?.text = member?.studentId
        
        return cell
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        self.performSegue(withIdentifier: "showProfileSegue", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showProfileSegue")
        {
            let upcoming: ProfileViewController = segue.destination as! ProfileViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.memberTableView.indexPathForSelectedRow
            // Group is set to the title at the row in the objects array.
            let selectedMember = self.currentGroup?.members[(indexPath?.row)!]
            upcoming.currentProfile = selectedMember
            self.memberTableView.deselectRow(at: indexPath!, animated: true)
        }
        
        if (segue.identifier == "showPeopleSegue") {
            let upcoming: PeopleViewController = segue.destination as! PeopleViewController
            // Set assignment on people view controller
            if self.currentGroup != nil {
                upcoming.currentGroup = currentGroup
            }
        }
    }
}
