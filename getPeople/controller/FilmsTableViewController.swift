//
//  FilmsTableViewController.swift
//  getPeople
//
//  Created by Hajar Alomari on 24/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    var result: [Movies] = []
    let urlString = "https://swapi.dev/api/films/?format=json"
    
    var film: Movies?

    override func viewDidLoad() {
        super.viewDidLoad()

    
       // fetchFilms()
        FilmApi.getAllFilms(completionHandler: { data, response , error in
           
           do{
               let api = Film.self
               let jsonResults = try JSONDecoder().decode(api, from: data!)
               DispatchQueue.main.async {
                   self.result = jsonResults.results
                   self.tableView.reloadData()
                  
               }
              
               //print(jsonResults.results[0].title)
           }catch{
               print("Failed to get data")
           }
           print("Success")
       })
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return result.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        let film = result[indexPath.row]
        cell.textLabel?.text = film.title

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        film = result[indexPath.row]
        print(film)
    }

    
    


    
//    func fetchFilms(){
//
//        guard let url = URL(string: urlString) else{
//            return
//        }
//
//
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
//            guard let data = data  , error == nil else {
//                return
//
//            }
//            do{
//                let api = Film.self
//                let jsonResults = try JSONDecoder().decode(api, from: data)
//                DispatchQueue.main.async {
//                    self?.result = jsonResults.results
//                    self?.tableView.reloadData()
//
//                }
//
//                //print(jsonResults.results[0].title)
//            }catch{
//                print("Failed to get data")
//            }
//            print("Success")
//        }
//        task.resume()
//
//    }

}
