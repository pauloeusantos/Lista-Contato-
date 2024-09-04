//
//  DetailViewController.swift
//  ProvaBaseiOS
//
//  Created by Jean Carlos on 17/08/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contactDetails: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    // MARK: - Methods
    
    public func setupDetail(contact: Contact) {
        contactDetails = contact
    }
    
    public func setupLabels() {
        nameLabel.text = contactDetails?.name
        lastName.text = contactDetails?.lastName
        phoneLabel.text = contactDetails?.phone
        emailLabel.text = contactDetails?.email
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
