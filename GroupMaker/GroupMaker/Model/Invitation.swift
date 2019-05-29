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
    let groupId: String
    let studentId: String
    
    //MARK: Variables
    var accepted = false //by default invitation is not yet accepted until user tap on accept button then it changes to true
    
    //MARK: Initialisers
    init(invitationId: String, groupId: String, studentId: String) {
        self.invitationId = invitationId
        self.groupId = groupId
        self.studentId = studentId
    }
}
