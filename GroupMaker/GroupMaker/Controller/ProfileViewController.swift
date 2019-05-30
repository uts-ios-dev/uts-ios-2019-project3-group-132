//
//  ProfileViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: Outlet
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var skillsTableView: UITableView!
    @IBOutlet weak var interestsTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    // MARK: Action
    @IBAction func backBtnPressed(_ sender: UIButton) {
    }
    
    // MARK: Initialiser
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
