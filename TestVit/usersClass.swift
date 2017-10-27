//
//  usersClass.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 11.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
class usersData {
    var name : String = ""
    var username : String = ""
    var email : String = ""
    var address : String = ""
    var street : String = ""
    var suite : String = ""
    var city : String = ""
    var zipcode : String = ""
    var phone : String = ""
    var website : String = ""
    var companyName : String = ""
    var catchPhrase : String = ""
    var bs : String = ""
 
    init(
     name : String,
     username : String,
     email : String,
     street : String,
     suite : String,
     city : String,
     zipcode : String,
     phone : String,
     website : String,
     companyName : String,
     catchPhrase : String,
     bs : String
        )
    {
        self.name = name
        self.username = username
        self.email = email
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.phone = phone
        self.website = website
        self.companyName = companyName
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    init(){
    }
}
