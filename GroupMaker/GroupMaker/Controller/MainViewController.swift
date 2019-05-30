//
//  MainViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var GroupsStackView: UIStackView!
    
    @IBOutlet weak var InvitesStackView: UIStackView!
    
    @IBOutlet weak var SwitcherGroupsInvites: UISegmentedControl!
    
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
