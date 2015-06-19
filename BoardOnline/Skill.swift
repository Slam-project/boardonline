//
//  Skill.swift
//  BoardOnline
//
//  Created by Alexandre on 19/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import Foundation

public class Skill {
    var id: Int!
    var category: String!
    var envTech: String!
    var experience: String!
    
    public init (id: Int, category: String, envTech: String, experience: String) {
        self.id = id
        self.category = category
        self.envTech = envTech
        self.experience = experience
    }
}