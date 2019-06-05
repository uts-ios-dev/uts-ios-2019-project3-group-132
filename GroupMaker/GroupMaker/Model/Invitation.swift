//
//  Invitation.swift
//  GroupMaker
//
//  Created by Jason JIANG on 27/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Invitation {
    
    //MARK: Constants
    let invitationId: String
    let group: Group
    let studentId: String
    let inviteeName: String
    
    //MARK: Variables
    var accepted = false //by default invitation is not yet accepted until user tap on accept button then it changes to true
    
    //MARK: Initialisers
    init(invitationId: String, group: Group, studentId: String, inviteeName: String) {
        self.invitationId = invitationId
        self.group = group
        self.studentId = studentId
        self.inviteeName = inviteeName
    }
}
