//
//  ViewController.swift
//  BoilerMethod
//
//  Created by shailesh on 16/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import UIKit

class ViewController: imageFromGallary {

    @IBOutlet var pickImage: UIButton!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var tableview: UITableView!
    var addresss = [Addres](){
        didSet{
            self.tableview.reloadData()
        }
        
    }
        
    var dataJSON = [RootClass]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hindOnTapped = true
        loaddata()
      }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loaddata(){
        RootClass.list { (users) in
            guard let users = users else {return}
            self.dataJSON = users
            print(users)
            
            Addres.list { (userrs) in
                guard let city = userrs else{return}
                self.addresss = city
                
                DispatchQueue.main.async {
                    self.tableview.refreshControl?.beginRefreshing()
                }
            }

            }
        

        }
    @IBAction func onClickedPickImage(_ sender: Any) {
        openOption()
    }
    override func selectedImage(chossenImage: UIImage) {
        imgView.image = chossenImage
    }
        
    }


extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresss.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.nameLbl.text = dataJSON[indexPath.row].email
        cell.surnameLabel.text = addresss[indexPath.row].city
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
