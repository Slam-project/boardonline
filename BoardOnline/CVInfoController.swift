//
//  CVInfoController.swift
//  BoardOnline
//
//  Created by Alexandre on 18/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit

class CVInfoController: UITableViewController {
    
    var cv: CV?
    
    private var infoPerso = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.infoPerso.append("Nom : " + cv!.nom)
        self.infoPerso.append("Prenom : " + cv!.prenom)
        self.infoPerso.append("Titre : " + cv!.titre!)
        
        self.loadExperiences()
        self.loadSkills()
        
    }
    
    // Load experiences
    func loadExperiences() {
        FirstViewController.socket.on("newXP"){ data, ack in
            if data?[0] as? Int == self.cv!.id,
                let id = data?[1] as? Int,
                let periode = data?[2] as? String,
                let client = data?[3] as? String,
                let poste = data?[4] as? String,
                let mission = data?[5] as? String
            {
                if self.cv?.listExperience.count < 5 {
                    let exp = Experience(id: id, periode: periode, client: client, poste: poste, mission: mission)
                    self.cv?.listExperience.append(exp)
                    self.tableView.reloadData()
                }
            }
        }
        
        if self.cv?.listExperience.count == 0 {
            FirstViewController.socket.emit("loadXP", self.cv!.id)
        }
    }
    
    // Load skills
    func loadSkills() {
        FirstViewController.socket.on("newSkill") { data, ack in
            if data?[0] as? Int == self.cv!.id,
                let id = data?[1] as? Int,
                let category = data?[2] as? String,
                let envTech = data?[3] as? String,
                let experience = data?[4] as? String
            {
                if self.cv?.listSkill.count < 5 {
                    self.cv?.addSkill(id, category: category, envTech: envTech, experience: experience)
                    self.tableView.reloadData()
                }
            }
        }
        
        if self.cv?.listSkill.count == 0 {
            FirstViewController.socket.emit("loadSkill", self.cv!.id)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return self.cv!.listExperience.count;
        } else {
            return self.cv!.listSkill.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "experience")
        if indexPath.section == 0 {
            cell.textLabel?.text = infoPerso[indexPath.row]
        } else if indexPath.section == 1 {
            if indexPath.row < self.cv?.listExperience.count {
                cell.textLabel?.text = self.cv?.listExperience[indexPath.row].poste
            }
        } else {
            if indexPath.row < self.cv?.listSkill.count {
                cell.textLabel?.text = self.cv?.listSkill[indexPath.row].experience
                cell.detailTextLabel?.text = self.cv!.listSkill[indexPath.row].category + "-" + self.cv!.listSkill[indexPath.row].envTech
            }
        }
        
        return cell;
    }
}
