//
//  BBCharacterTableViewCell.swift
//  Hogwarts-C
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class BBCharacterTableViewCell: UITableViewCell {
    // MARK: - Outlets
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterRoleLabel: UILabel!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var bloodStatusImage: UIImageView!
    @IBOutlet weak var deathEaterImage: UIImageView!
    
    func updateViews(for character: BBCharacter) {
        if character.deathEater == true {
            deathEaterImage.isHidden = false
        }
        
        if character.bloodStatus != "unknown" {
            bloodStatusImage.isHidden = false
            bloodStatusImage.image = UIImage.init(named: character.bloodStatus)
        }
        
        if let house = character.house {
            houseImage.isHidden = false
            houseImage.image = UIImage.init(named: house.lowercased())
        }
        characterNameLabel.text = character.name
        characterRoleLabel.text = character.role
    }
}
