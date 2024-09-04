//
//  ViewController.swift
//  ProvaBaseiOS
//
//  Created by Jean Carlos on 13/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var contatTableView: UITableView!
    
    var contactList: [Contact] = []
    let userDefault = UserDefaults.standard
    let contactListKey: String = "CONTACTLISTKEY"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Methods
    private func configureTableView() {
        contatTableView.delegate = self
        contatTableView.dataSource = self
        
        do {
            if let dataList = userDefault.data(forKey: contactListKey) {
                let contactList = try JSONDecoder().decode([Contact].self, from: dataList)
                self.contactList = contactList
                contatTableView.reloadData()
            }
        } catch {
            print("Erro ao recuperar a lista de contatos: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerDestination = segue.destination as? DetailViewController {
            guard let contact = sender as? Contact else { return }
            viewControllerDestination.setupDetail(contact: contact)
        }
        
        if let viewControllerDestination = segue.destination as? CreateNewContactViewController {
            viewControllerDestination.delegate = self
        }
    }
    
    @IBAction func addContact(_ sender: Any) {
        performSegue(withIdentifier: "addContact", sender: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! ContactTableViewCell
        cell.setup(contact: contact)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactSelected = contactList[indexPath.row]
        performSegue(withIdentifier: "contactDetails", sender: contactSelected)
    }
}

extension ViewController: CreateNewContactViewControllerProtocol {
    func createNewContact(with contact: Contact) {
        contactList.append(contact)
        contatTableView.reloadData()
        
        do {
            let dataList = try JSONEncoder().encode(contactList)
            userDefault.setValue(dataList, forKey: contactListKey)
        } catch {
            print("Não foi possível salvar a lista de contatos: \(error.localizedDescription)")
        }
    }
}
