//
//  GroupViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDataSource {
    
    // MARK: Outlet
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subjectLbl: UILabel!
    @IBOutlet weak var assignmentLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var addMemberBtn: UIButton!
    @IBOutlet weak var memberTableView: UITableView!
    
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
        
        if(currentGroup != nil) {
            titleLbl.text = currentGroup?.name
            subjectLbl.text = "Subject Id: \(currentGroup?.subjectId ?? "Subject Id: <None Defined>")"
            assignmentLbl.text = "Assignment: \(currentGroup?.assignment.name ?? "Assignment: <None defined>")"
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showProfileSegue")
        {
        }
    }
}
