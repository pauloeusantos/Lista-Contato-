//
//  Contact.swift
//  ProvaBaseiOS
//
//  Created by Jean Carlos on 17/08/24.
//

import Foundation

struct Contact: Encodable, Decodable {
    let name: String
    let lastName: String
    let email: String
    let phone: String
}
