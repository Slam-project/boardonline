//
//  experience.swift
//  BoardOnline
//
//  Created by Alexandre on 18/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import Foundation

public class Experience {
    var id: Int!
    var periode: String!
    var client: String! // correspond à l'employeur
    var poste: String!
    var mission: String!
    
    public init (id: Int, periode: String, client: String, poste: String, mission: String) {
        self.id = id
        self.periode = periode
        self.client = client
        self.poste = poste
        self.mission = mission
    }
}