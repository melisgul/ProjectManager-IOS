//
//  photoPerson.swift
//  DENEME
//
//  Created by Admin on 27/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit



class photoPerson:Mappable{
    var photo:UIImage?
    var person:Person?
    
    init(_ person:Person,_ image:UIImage) {
        self.person = person
        self.photo = image
    }
    
    
    required init?(map: Map) {
        
    }
    
    
     func mapping(map: Map) {
        photo <- map["photo"]
        person <- map["person"]
    }
}
