//
//  SecondViewController.swift
//  BoardOnline
//
//  Created by Alexandre on 17/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {

    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var prenomTextField: UITextField!
    @IBOutlet weak var titreTextField: UITextField!

    static var cv: CV?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstViewController.socket.on("newSelfCV") { data, ack in
            if let id = data?[0] as? Int,
                let nom = data?[1] as? String,
                let prenom = data?[2] as? String,
                let titre = data?[3] as? String,
                let lastForm = data?[4] as? String,
                let experience = data?[5] as? String
            {
                SecondViewController.cv = CV(id: id, nom: nom, prenom: prenom, titre: titre, lastFormation: lastForm, experience: experience)
                
                self.nomTextField.text = SecondViewController.cv?.nom
                self.prenomTextField.text = SecondViewController.cv?.prenom
                self.titreTextField.text = SecondViewController.cv?.titre
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if SecondViewController.cv == nil {
            let firstViewController = FirstViewController()
            self.performSegueWithIdentifier("loginPopin", sender: self)
        }
    }
    
    
    @IBAction func SaveAction(sender: UIButton) {
        SecondViewController.cv?.nom = self.nomTextField.text
        SecondViewController.cv?.prenom = self.prenomTextField.text
        SecondViewController.cv?.titre = self.titreTextField.text
        
        FirstViewController.socket.emit("editCV", SecondViewController.cv!.nom, SecondViewController.cv!.prenom, SecondViewController.cv!.titre)
        
        var alert = UIAlertController(title: "Notification", message: "Votre CV a bien été enregitré", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}

