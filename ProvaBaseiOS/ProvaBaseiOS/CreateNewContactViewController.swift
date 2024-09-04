//
//  CreateNewContactViewController.swift
//  ProvaBaseiOS
//
//  Created by Jean Carlos on 17/08/24.
//

import UIKit

protocol CreateNewContactViewControllerProtocol {
    func createNewContact(with contact: Contact)
}

class CreateNewContactViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var delegate: CreateNewContactViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Methods
    
    @IBAction func saveContact(_ sender: Any) {
        
        delegate?.createNewContact(with:Contact(name: nameTextField.text ?? "", lastName: lastNameTextField.text ?? "",
                                                email: emailTextField.text ?? "",
                                                phone: phoneTextField.text ?? ""))
        navigationController?.popViewController(animated: true)
    }
}
