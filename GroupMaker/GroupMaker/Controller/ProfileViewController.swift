//
//  ProfileViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Outlet
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var skillsTableView: UITableView!
    @IBOutlet weak var interestsTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var studentNumberLbl: UILabel!
    
    // MARK: Action
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Variables
    var currentProfile: Student? = nil
    
    // MARK: Initialiser
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let profile = currentProfile {
            titleLbl.text = profile.preferredName
            studentNumberLbl.text = "Student Number: \(profile.studentId)"
            fullNameLbl.text = "Full Name: \(profile.fullName)"
        }
        
        skillsTableView.dataSource = self
    }
    
    // MARK: TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentProfile?.skills.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
        if tableView == skillsTableView {
            let cell = skillsTableView.dequeueReusableCell(withIdentifier: "cellSkill", for: indexPath)
            
            let skill = currentProfile?.skills[indexPath.row]
            cell.textLabel?.text = skill?.skillName
            
            cellToReturn = cell
        }
        
        return cellToReturn
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
