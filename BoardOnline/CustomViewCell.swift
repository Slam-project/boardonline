//
//  CustomViewCell.swift
//  BoardOnline
//
//  Created by Alexandre on 17/06/2015.
//  Copyright (c) 2015 Les_Smileyz. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet var nomPrenom: UILabel!
    @IBOutlet var titre: UILabel!
    @IBOutlet var lastFormation: UILabel!
    @IBOutlet var experience: UILabel!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCellContent(cv: CV) {
        self.nomPrenom.text = cv.nom + " " + cv.prenom
        self.titre.text = "Titre : " + cv.titre
        self.lastFormation.text = "Dernière formation : " + cv.lastFormation
        self.experience.text = cv.experience
    }
}
