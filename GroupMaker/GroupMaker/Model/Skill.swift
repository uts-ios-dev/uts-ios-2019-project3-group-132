//
//  Skill.swift
//  GroupMaker
//
//  Created by Jason JIANG on 30/5/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import Foundation

class Skill {
    
    //MARK: Constants
    let skillId: String
    let skillName: String
    
    
    //MARK: Variables
    var skillPoint = 0 //by default the skill point of a skill is 0 until defined with an actual value
    
    //MARK: Initialisers
    init(skillId: String, skillName: String, skillPoint: Int) {
        self.skillId = skillId
        self.skillName = skillName
        self.skillPoint = skillPoint
    }
}
