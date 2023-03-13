//
//  ContactViewModel.swift
//  SearchList
//
//  Created by Abdoulaye Aliou SALL on 13/03/2023.
//

import Foundation
import Contacts

class ContactsViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    func fetchContacts() {
        print("voici mes contacts")
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if granted {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
                let request = CNContactFetchRequest(keysToFetch: keys)
                
                do {
                    var contacts = [Contact]()
                    try store.enumerateContacts(with: request) { contact, _ in
                        let name = "\(contact.givenName) \(contact.familyName)"
                        for phoneNumber in contact.phoneNumbers {
                            let number = phoneNumber.value.stringValue
                            contacts.append(Contact(givenName: contact.givenName, familyName: contact.familyName, phoneNumber: number))
                        }
                    }
                    self.contacts = contacts
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}



