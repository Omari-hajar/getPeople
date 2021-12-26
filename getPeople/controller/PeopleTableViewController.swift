//
//  PeopleTableViewController.swift
//  getPeople
//
//  Created by Hajar Alomari on 24/12/2021.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    var result: [Results] = []
    let urlString = "https://swapi.dev/api/people/?format=json"
    var person: Results?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchPeopl()
        
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return result.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = result[indexPath.row]
        cell.textLabel?.text = person.name
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        person = result[indexPath.row]
        performSegue(withIdentifier: "segueToPerson", sender: nil)
     
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPerson"{
            if let cv = segue.destination as? PersonViewController {
                cv.person = person
            }
        }
    }

    
    func fetchPeopl(){
        
        guard let url = URL(string: urlString) else{
            return
        }
        
      
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
            guard let data = data  , error == nil else {
                return
                
            }
            do{
                let api = People.self
                let jsonResults = try JSONDecoder().decode(api, from: data)
                DispatchQueue.main.async {
                    self?.result = jsonResults.results
                    self?.tableView.reloadData()
                   
                }
               
                print(jsonResults.results.count)
            }catch{
                print("Failed to get data")
            }
            print("Success")
        }
        task.resume()
        
    }


    

}
