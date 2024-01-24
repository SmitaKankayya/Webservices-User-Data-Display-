//
//  UsersDM.swift
//  WebservicesUsersAPICall
//
//  Created by Smita Kankayya on 19/01/24.
//

import Foundation


struct UsersDM : Decodable {
    
    let address: Address
    let username: String
    let email : String
    let name : Name
    
    }

struct Address: Decodable {
    
    let geolocation: Geolocation
    let city: String
    let street: String
    let number: Int
    let zipcode: String
    
    }

struct Geolocation: Decodable {
    
    let lat: String
    let long: String
    
    }

struct Name: Decodable {
    
    let firstname: String
    let lastname: String
    
}


