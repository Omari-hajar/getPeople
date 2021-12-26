//
//  Film.swift
//  getPeople
//
//  Created by Hajar Alomari on 24/12/2021.
//

import Foundation


struct Film : Codable{
    let results: [Movies]
}

struct Movies : Codable {
    let title: String
    let opening_crawl: String
    let director: String
    let release_date: String
}
