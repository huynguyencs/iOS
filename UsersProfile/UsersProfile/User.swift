//
//  User.swift
//  UsersProfile
//
//  Created by Thanh Hoang on 11/23/15.
//  Copyright © 2015 Thanh Hoang. All rights reserved.
//

import Foundation

class User {
    private var firstName: String
    private var lastName: String
    private var phoneNumber: String
    private var address: String
    
    init(firstName: String, lastName: String, phone: String, address: String){
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phone
        self.address = address
    }
    
    func getFirstName() -> String {
        return self.firstName
    }
    
    func getLastName() -> String {
        return self.lastName
    }
    
    func getPhoneNumber() -> String {
        return self.phoneNumber
    }
    
    func getAddress() -> String {
        return self.address
    }
    
    func getFullName() -> String {
        return self.firstName + " " + self.lastName
    }
    
    func toString() -> String {
        var str: String
        str = "First Name: " + getFirstName()
        str += "\nLast Name: " + getLastName()
        str += "\nPhone Number: " + getPhoneNumber()
        str += "\nAddress: " + getAddress()
        
        return str
    }
}