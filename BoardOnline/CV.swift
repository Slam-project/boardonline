//
//  CV.swift
//  BoardOnline
//
//  Created by Alexandre on 17/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import Foundation

public class CV : NSObject{
    
    var id: Int!
    var nom: String!
    var prenom: String!
    var titre: String!
    var lastFormation: String!
    var experience: String!
    var listExperience: [Experience]!
    var listSkill: [Skill]!
    
    public init (id: Int, nom: String, prenom: String, titre: String, lastFormation: String, experience: String) {
        
        self.id = id
        self.nom = nom
        self.prenom = prenom
        self.titre = titre
        self.lastFormation = lastFormation
        self.experience = experience
        self.listExperience = [Experience]()
        self.listSkill = [Skill]()
    }
    
    // add an existing experience to listExperience
    public func addExperience(exp: Experience) {
        
        self.listExperience.append(exp)
    }
    
    // create and add an experience to listExperience
    public func addExperience(id: Int, periode: String, client: String, poste: String, mission: String) {
        
        var exp = Experience(id: id, periode: periode, client: client, poste: poste, mission: mission)
        self.listExperience.append(exp)
    }
    
    // return a specifique experience
    public func getExperience(position: Int) -> Experience
    {
        if self.listExperience.count > position && position >= 0 {
            return self.listExperience[position]
        }
        
        return self.listExperience[0]
    }
    
    // add an existing skill to listSkill
    public func addSkill(skill: Skill) {
        self.listSkill.append(skill)
    }
    
    // create and add skill to listSkills
    public func addSkill(id: Int, category: String, envTech: String, experience: String) {
        var skill = Skill(id: id, category: category, envTech: envTech, experience: experience)
        self.listSkill.append(skill)
    }
    
    // return list of skills
    public func getSkills() -> [Skill] {
        return self.listSkill
    }

}