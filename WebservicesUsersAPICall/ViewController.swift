//
//  ViewController.swift
//  WebservicesUsersAPICall
//
//  Created by Smita Kankayya on 19/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    var user : [UsersDM] = []
    
    var userDetailsViewController : UserDetailsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIBWithTableView()
        initializeTableView()
        JsonDecoder()
    }
    
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.userTableView.register(uiNib, forCellReuseIdentifier: "TableViewCell")
    }
    
    func initializeTableView(){
        userTableView.dataSource = self
        userTableView.delegate = self
    }
    
    func JsonDecoder(){
        let url = URL(string: "https://fakestoreapi.com/users")
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            let jsonDecoder = JSONDecoder()
            self.user = try! jsonDecoder.decode([UsersDM].self, from: data!)
            
            print(self.user)
            
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
        dataTask.resume()
    }
}

//MARK : UITableViewDataSource
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = self.userTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        tableViewCell?.firstName.text = ("FirstName : \(user[indexPath.row].name.firstname)")
        tableViewCell?.lastName.text = ("LastName : \(user[indexPath.row].name.lastname)")
        tableViewCell?.userName.text = ("UserName : \(user[indexPath.row].username)")
        return tableViewCell!
    }
}

//MARK : UITableViewDelegate
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController
        userDetailsViewController?.userContainer = user[indexPath.row]
        
        navigationController?.pushViewController(userDetailsViewController!, animated: true)
    }
}

