//
//  Players.swift
//  RealMadrid
//
//  Created by CIS Student on 11/3/17.
//  Copyright © 2017 Freed Hardeman University. All rights reserved.
//

import Foundation

public class Players {
    
    var name: String?
    var position: String?
    var hometown: String?
    var height: String?
    var nationalTeam: String?
    var dob: String?
    var imageName: String?
    var imageURL: String?
    
    
    
    convenience init( name: String, position: String, hometown: String, height: String, nationalTeam: String, dob: String, imageName: String) {
        self.init()
        
        self.name = name
        self.position = position
        self.hometown = hometown
        self.height = height
        self.nationalTeam = nationalTeam
        self.dob = dob
        self.imageName = imageName
        
    }
    
    convenience init(name: String, position:String, hometown: String, height: String, nationalTeam: String, dob:String, imageURL: String) {
        self.init()
        
        self.name = name
        self.position = position
        self.hometown = hometown
        self.height = height
        self.nationalTeam = nationalTeam
        self.dob = dob
        self.imageURL = imageURL
    }
    
}
