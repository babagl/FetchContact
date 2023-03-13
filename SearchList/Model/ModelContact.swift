//
//  ModelContact.swift
//  SearchList
//
//  Created by Abdoulaye Aliou SALL on 13/03/2023.
//

import Foundation
struct Contact: Identifiable {
    var id = UUID()
    var givenName: String
    var familyName: String
    var phoneNumber: String
}
