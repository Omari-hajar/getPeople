//
//  PersonViewController.swift
//  getPeople
//
//  Created by Hajar Alomari on 25/12/2021.
//

import UIKit

class PersonViewController: UIViewController {
   
    

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    var person: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        if let character = person {
            print(character)
            nameLabel.text = character.name
            genderLabel.text = character.gender
            birthYearLabel.text = character.birth_year
            massLabel.text = character.mass
            
        }
        
       
        
    }
    
 

}
