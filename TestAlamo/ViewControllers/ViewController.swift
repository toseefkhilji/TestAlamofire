//
//  ViewController.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import UIKit
import RandomColorSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tblview: UITableView!
    var contacts : [Contact] = []
    var colors : [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tblview.showLoader()
        APIManager.getContacts { (isSuccess, contacts) in
            if(isSuccess){
                debugPrint(contacts)
                self.contacts = contacts
                self.colors = randomColors(count:contacts.count ,luminosity: .light)
                self.tblview.hideLoader()
                self.tblview.reloadData()
            }
        }
    }
    
    
    func removeLoader()
    {
        self.tblview.hideLoader()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destVC : ContactDetailVC = segue.destination as! ContactDetailVC
            destVC.contact = contacts[(tblview.indexPathForSelectedRow?.row)!]
        }
    }
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        let contact = contacts[indexPath.row]
        cell.lblIcon.backgroundColor = colors[indexPath.row]
        cell.lblIcon.text = String(contact.name.characters.prefix(1))
        cell.lblName.text = contact.name
        cell.lblPhone.text = contact.phone.mobile
        return cell
    }
}

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lblIcon.layer.cornerRadius = 20
    }
}

