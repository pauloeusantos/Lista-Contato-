//
//  ContactTableViewCell.swift
//  ProvaBaseiOS
//
//  Created by Jean Carlos on 17/08/24.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setup(contact: Contact) {
        nameLabel.text = contact.name
        lastNameLabel.text = contact.lastName
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
    }
}
