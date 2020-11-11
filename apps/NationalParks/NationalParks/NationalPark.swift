//
//  NationalPark.swift
//  NationalParks
//
//  Created by Krish Bhavnani on 11/9/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit

struct APIData : Codable {
    let data : [NationalPark]
}

struct NationalPark : Codable {
    let fullName : String
    let designation : String
    let description : String
    let images : [ParkImage]
}

struct ParkImage : Codable {
    let url : URL
}


