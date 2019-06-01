//
//  MainViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlet
    @IBOutlet weak var GroupsStackView: UIStackView!
    
    @IBOutlet weak var InvitesStackView: UIStackView!
    
    @IBOutlet weak var CreateGroupBtn: UIButton!
    
    @IBOutlet weak var GroupTableView: UITableView!
    
    @IBOutlet weak var SwitcherGroupsInvites: UISegmentedControl!
    
    // MARK: Action
    @IBAction func createBtnPressed(_ sender: UIButton)
    {
        let ac = UIAlertController(title: "Group Name", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        ac.add
            
        let submitAction = UIAlertAction(title: "Create", style:.default) {
            
            [unowned ac] _ in
        
            let answer = ac.textFields![0]
        
            //let group = Group(groupId: "2", name: answer.text!, subjectId: "3", assignment: Assignment(assignmentId: "123"), groupSize: 3)

            //groupList.append(group)
            
        }
            
        ac.addAction(submitAction)
            
        present(ac, animated: true)
    }
    
    @IBAction func SwitchGroupsInvites(_ sender: UISegmentedControl) {
        
        switch SwitcherGroupsInvites.selectedSegmentIndex {
        case 0: // groups
            GroupsStackView.isHidden = false
            InvitesStackView.isHidden = true
        case 1: // invites
            GroupsStackView.isHidden = true
            InvitesStackView.isHidden = false
        default:
            break
        }
    }
    
    // MARK: Variable
    
    //TODO: Not hardcode this list
    var groupList: Array<Group> = Helper.getGroups()
    
    // MARK: Initialiser
    override func viewDidLoad() {
        super.viewDidLoad()

        GroupTableView.dataSource = self
        GroupTableView.delegate = self
    }
    
    // MARK: TableView
    
    // Datasource Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = GroupTableView.dequeueReusableCell(withIdentifier: "cellGroup", for: indexPath)
        
        let group = groupList[indexPath.row]
        cell.textLabel?.text = group.name
        cell.detailTextLabel?.text = "No. of Members: \(group.size)"
        
        return cell
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        self.performSegue(withIdentifier: "showGroup", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showGroup")
        {
            // upcoming is set to NewViewController (.swift)
            let upcoming: GroupViewController = segue.destination as! GroupViewController
            // indexPath is set to the path that was tapped
            let indexPath = self.GroupTableView.indexPathForSelectedRow
            // Group is set to the title at the row in the objects array.
            let selectedGroup = self.groupList[(indexPath?.row)!]
            // the Group property of GroupViewController is set.
            upcoming.currentGroup = selectedGroup
            self.GroupTableView.deselectRow(at: indexPath!, animated: true)
        }
    }
}
