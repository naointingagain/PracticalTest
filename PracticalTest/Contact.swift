//
//  Contact.swift
//  PracticalTest
//
//  Created by MAD2 on 9/12/19.
//  Copyright © 2019 MAD2. All rights reserved.
//

import Foundation
import UIKit

class Contact{
    
    var firstname:String
    var lastname:String
    var photo:UIImage
    var telephone:String
    
    init(firstname:String, lastname:String, photo:UIImage, telephone:String) {
        self.firstname = firstname
        self.lastname = lastname
        self.photo = photo
        self.telephone = telephone
    }
}
