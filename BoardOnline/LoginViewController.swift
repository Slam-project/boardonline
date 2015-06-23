//
//  LoginViewController.swift
//  BoardOnline
//
//  Created by Alexandre on 23/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.secureTextEntry = true
    }
    
    // when user click on connect button we send data to server. The server will send a response (disconnect or connect)
    @IBAction func connectAction(sender: UIButton) {
        FirstViewController.socket.on("co") { data, ack in
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        FirstViewController.socket.on("dis") { data, ack in
            if let error = data?[0] as? String {
                self.errorLabel.text = error
            }
        }
        
        FirstViewController.socket.emit("connect", loginTextField.text, passwordTextField.text)
    }
}
