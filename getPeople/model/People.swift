//
//  People.swift
//  getPeople
//
//  Created by Hajar Alomari on 24/12/2021.
//

import Foundation

struct People: Codable{
    let results: [Results]
}

struct Results: Codable {
    let name: String
    let mass: String
    let birth_year: String
    let gender: String
    let films: [String]
}
