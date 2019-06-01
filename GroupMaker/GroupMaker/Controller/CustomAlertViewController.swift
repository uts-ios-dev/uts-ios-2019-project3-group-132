//
//  CustomAlertViewController.swift
//  GroupMaker
//
//  Created by Callum Crossley on 1/6/19.
//  Copyright © 2019 Group 132. All rights reserved.
//

import UIKit
import iOSDropDown

class CustomAlertViewController: UIViewController {
    
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var assignmentDropDown: DropDown!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var groupSizeLbl: UILabel!
    @IBOutlet weak var sizeStepper: UIStepper!
    
    
    var delegate: CustomAlertViewDelegate?
    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupNameTextField.becomeFirstResponder()
        
        // Fill the drop-down menu
        assignmentDropDown.optionArray = Helper.getAssignments().map {$0.name}
        
        // Stepper defaults
        sizeStepper.wraps = true
        sizeStepper.autorepeat = true
        sizeStepper.maximumValue = 10
        sizeStepper.minimumValue = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    func setupView() {
        alertView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView() {
        alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    
    @IBAction func onTapCreateButton(_ sender: Any) {
        groupNameTextField.resignFirstResponder()
        if let assignment = assignmentDropDown.text {
            delegate?.okButtonTapped(selectedOption: assignment, textFieldValue: groupNameTextField.text!, groupSize: Int(groupSizeLbl.text ?? "1") ?? 1)
        }
    }
    
    @IBAction func onTapCancelButtom(_ sender: Any) {
        groupNameTextField.resignFirstResponder()
        delegate?.cancelButtonTapped()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        groupSizeLbl.text = Int(sender.value).description
    }
}
