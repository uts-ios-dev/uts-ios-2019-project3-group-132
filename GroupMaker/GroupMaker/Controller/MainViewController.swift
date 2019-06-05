//
//  MainViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

protocol CellDelegate: class {
    func acceptButtonPressed(_ sender: UIButton)
    
    func declineButtonPressed(_ sender: UIButton)
}

class InviteTableViewCell: UITableViewCell {
    @IBOutlet weak var groupNameLbl: UILabel!
    @IBOutlet weak var acceptBtn: UIButton!
    @IBOutlet weak var declineBtn: UIButton!
    
    weak var delegate: CellDelegate?
    
    @IBAction func acceptBtnPressed(_ sender: UIButton) {
        delegate?.acceptButtonPressed(sender)
    }
    
    @IBAction func declineBtnPressed(_ sender: UIButton) {
        delegate?.declineButtonPressed(sender)
    }
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CellDelegate {
    
    // MARK: Outlet
    @IBOutlet weak var GroupsStackView: UIStackView!
    
    @IBOutlet weak var InvitesStackView: UIStackView!
    
    @IBOutlet weak var CreateGroupBtn: UIButton!
    
    @IBOutlet weak var GroupTableView: UITableView!
    
    @IBOutlet weak var InvitesTableView: UITableView!
    
    @IBOutlet weak var SwitcherGroupsInvites: UISegmentedControl!
    
    // MARK: Action
    @IBAction func createBtnPressed(_ sender: UIButton)
    {
        let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertID") as! CustomAlertViewController
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
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
    var inviteList: Array<Invitation> = Helper.getInvites()
    
    // MARK: Initialiser
    override func viewDidLoad() {
        super.viewDidLoad()

        GroupTableView.dataSource = self
        GroupTableView.delegate = self
        
        InvitesTableView.dataSource = self
        InvitesTableView.delegate = self
        
        //Call this to ensure both aren't displayed on first loading
        SwitchGroupsInvites(self.SwitcherGroupsInvites)
        // Update title with invite count
        SwitcherGroupsInvites.setTitle("Invites (\(inviteList.count))", forSegmentAt: 1)
    }
    
    // MARK: TableView
    
    // Datasource Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        
        if tableView == GroupTableView {
            count = groupList.count
        }
        
        if tableView == InvitesTableView {
            count = inviteList.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
        if tableView == GroupTableView {
            let cell = GroupTableView.dequeueReusableCell(withIdentifier: "cellGroup", for: indexPath)
            
            let group = groupList[indexPath.row]
            cell.textLabel?.text = group.name
            cell.detailTextLabel?.text = "No. of Members: \(group.size)"
            
            cellToReturn = cell
        } else if tableView == InvitesTableView {
            let cell = InvitesTableView.dequeueReusableCell(withIdentifier: "inviteCell", for: indexPath) as! InviteTableViewCell
            
            let invite = inviteList[indexPath.row]
            cell.delegate = self
            cell.groupNameLbl.text = "\(invite.group.name)"
            
            cellToReturn = cell
        }
        
        return cellToReturn
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == GroupTableView) {
            //getting the index path of selected row
            self.performSegue(withIdentifier: "showGroup", sender: self)
        }
        
        if (tableView == InvitesTableView) {
            //getting the index path of selected row
            self.performSegue(withIdentifier: "showGroupInvitation", sender: self)
        }
    }
    
    // MARK: Cell Delegate
    func acceptButtonPressed(_ sender: UIButton) {
        if let indexPath = getCurrentCellIndexPath(sender){
            // Get the current invite
            let item = inviteList[indexPath.row]
            
            // Add group to current groups
            item.group.addGroupMember(student: Helper.getStudents()[0])
            groupList.append(item.group)
            
            // Remove it from the invite list
            inviteList = inviteList.filter({$0.invitationId != item.invitationId})
            
            self.refresh()
        }
    }
    
    func declineButtonPressed(_ sender: UIButton) {
        if let indexPath = getCurrentCellIndexPath(sender){
            // Get the current invite
            let item = inviteList[indexPath.row]
            
            // Remove it from the invite list
            inviteList = inviteList.filter({$0.invitationId != item.invitationId})
            
            self.refresh()
        }
    }
    
    func getCurrentCellIndexPath(_ sender: UIButton) -> IndexPath? {
        let buttonPosition = sender.convert(CGPoint.zero, to: InvitesTableView)
        if let indexPath: IndexPath = InvitesTableView.indexPathForRow(at: buttonPosition) {
            return indexPath
        }
        
        InvitesTableView.indexPath
        return nil
    }
    
    // MARK: - Other functions
    
    func refresh() {
        //Refresh the two tables data
        InvitesTableView.reloadData()
        GroupTableView.reloadData()
        SwitcherGroupsInvites.setTitle("Invites (\(inviteList.count))", forSegmentAt: 1)
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
            let indexPath = GroupTableView.indexPathForSelectedRow
            // Group is set to the title at the row in the objects array.
            let selectedGroup = self.groupList[(indexPath?.row)!]
            // the Group property of GroupViewController is set.
            upcoming.currentGroup = selectedGroup
            self.GroupTableView.deselectRow(at: indexPath!, animated: true)
        }
        
        if (segue.identifier == "showGroupInvitation")
        {
            // upcoming is set to NewViewController (.swift)
            let upcoming: GroupInvitationViewController = segue.destination as! GroupInvitationViewController
            // indexPath is set to the path that was tapped
            let indexPath = InvitesTableView.indexPathForSelectedRow
            // Group is set to the title at the row in the objects array.
            let selectedGroup = self.inviteList[(indexPath?.row)!].group
            // the Group property of GroupViewController is set.
            upcoming.currentGroup = selectedGroup
            self.GroupTableView.deselectRow(at: indexPath!, animated: true)
        }
    }
}

extension MainViewController: CustomAlertViewDelegate {
    func okButtonTapped(selectedOption: String, textFieldValue: String, groupSize: Int) {
        if let assignment = Helper.getAssignmentWithName(name: selectedOption) {
            groupList.append(Group(groupId: "1", name: textFieldValue, subjectId: "1", assignment: assignment, groupSize: groupSize, member: Helper.getStudents()[0]))
            self.GroupTableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        } else {
            
        }
    }
    
    func cancelButtonTapped() {
        //Do nothing
    }
}
