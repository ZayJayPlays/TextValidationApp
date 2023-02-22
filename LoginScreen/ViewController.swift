//
//  ViewController.swift
//  LoginScreen
//
//  Created by Zane Jones on 2/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameTextBox: UITextField!
    @IBOutlet var passwordTextBox: UITextField!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var submitButton: UIButton!
    
    let specialCharSet = CharacterSet(charactersIn: "`~!@#$%^&*()-=_+{}|[]\'<>?,.'")
    let numberCharSet = CharacterSet(charactersIn: "0123456789")
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.isHidden = true
    }
    
    
    @IBAction func submitCredentials() {
        guard usernameTextBox.text != nil else {
            showFailure()
            return
        }
        guard passwordTextBox.text != nil  else { showFailure()
            return
        }
        guard (passwordTextBox.text?.rangeOfCharacter(from: numberCharSet)) != nil && (passwordTextBox.text?.rangeOfCharacter(from: specialCharSet)) != nil else {
            showFailure()
            return
        }
        
        guard passwordTextBox.text!.count >= 8  else {
            showFailure()
            return
        }
        messageLabel.text = "Success"
        messageLabel.textColor = UIColor.green
        messageLabel.isHidden = false;
    }
                
    func showFailure() {
        messageLabel.text = "Failure"
        messageLabel.textColor = UIColor.red
        messageLabel.isHidden = false;
    }
}

