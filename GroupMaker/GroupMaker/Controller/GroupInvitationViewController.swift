//
//  GroupInvitationViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 5/6/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class GroupInvitationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var assignmentLabel: UILabel!
    @IBOutlet weak var groupSizeLbl: UILabel!
    @IBOutlet weak var membersTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var acceptBtn: UIButton!
    @IBOutlet weak var declineBtn: UIButton!
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func acceptBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func declineBtnPressed(_ sender: Any) {
    }
    
    // MARK: Variables
    var currentGroup: Group? = nil
    
    
    // MARK: Initialisers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        membersTableView.dataSource = self
        membersTableView.delegate = self
        
        if let group = currentGroup {
            titleLbl.text = group.name
            subjectLbl.text = "Subject Id: \(group.subjectId)"
            assignmentLabel.text = "Assignment: \(group.assignment.name)"
            groupSizeLbl.text = "Max Group Size: \(group.maxGroupSize)"
        }
    }
    
    // MARK: TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroup?.members.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = membersTableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        
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
            // upcoming is set to NewViewController (.swift)
            let upcoming: ProfileViewController = segue.destination as! ProfileViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.membersTableView.indexPathForSelectedRow
            // Group is set to the title at the row in the objects array.
            let selectedMember = self.currentGroup?.members[(indexPath?.row)!]
            // the Group property of GroupViewController is set.
            upcoming.currentProfile = selectedMember
            self.membersTableView.deselectRow(at: indexPath!, animated: true)
        }
    }
}
