//
//  FilmApi.swift
//  getPeople
//
//  Created by Hajar Alomari on 24/12/2021.
//

import Foundation


class FilmApi {
    
   // let urlString = "https://swapi.dev/api/films/?format=json"
    
    static func getAllFilms(completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        
        guard let url = URL(string: "https://swapi.dev/api/films/?format=json") else {
            return
        }
      
        let task = URLSession.shared.dataTask(with: url, completionHandler: completionHandler)
           
        task.resume()
        
    }
    
}

