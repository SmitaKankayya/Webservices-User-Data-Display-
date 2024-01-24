//
//  UserDetailsViewController.swift
//  WebservicesUsersAPICall
//
//  Created by Smita Kankayya on 19/01/24.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var streetLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var zipcodeLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var userContainer : UsersDM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        }
    
    func bindData(){
        
        self.latLabel.text = userContainer?.address.geolocation.lat
        self.longLabel.text = userContainer?.address.geolocation.long
        self.cityLabel.text = userContainer?.address.city
        self.streetLabel.text = userContainer?.address.street
        self.numberLabel.text = "\(userContainer?.address.number ?? 0)"
        self.zipcodeLabel.text = userContainer?.address.zipcode
        self.emailLabel.text = userContainer?.email
        
    }
}
