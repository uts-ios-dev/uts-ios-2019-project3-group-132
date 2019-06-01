//
//  CustomAlertViewDelegate.swift
//  GroupMaker
//
//  Created by Callum Crossley on 1/6/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

protocol CustomAlertViewDelegate: class {
    func okButtonTapped(selectedOption: String, textFieldValue: String, groupSize: Int)
    func cancelButtonTapped()
}
