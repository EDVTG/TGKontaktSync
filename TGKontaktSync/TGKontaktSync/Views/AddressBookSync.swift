//
//  AddressBookSync.swift
//  TGKontaktSync
//
//  Created by edv on 25.06.23.
//

import SwiftUI
import Contacts

struct AddressBookSync: View {
    
    @State private var containers: [CNContainer] = []
    @State private var container1Contacts: [CNContact] = []
    @State private var container2Contacts: [CNContact] = []
    @State private var container3Contacts: [CNContact] = []
    @State private var showAlert = false
    @State private var syncContactsCount = 0 // Track the count of sync contacts
        
    
    
    var body: some View {
        NavigationView{
            VStack {
                
                // Display container type 1 contacts
                Section(header: Text("Local Kontakte (\(container1Contacts.count) contacts)").font(.custom("Ubuntu-Bold", size: 10)).foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))) {
                    List(container1Contacts, id: \.self) { contact in
                        VStack(alignment: .leading) {
                            Text("\(contact.givenName) \(contact.familyName)")
                                .font(.custom("Ubuntu-Bold", size: 10))
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .font(.headline)
                            
                            if let organizationName = contact.organizationName {
                                Text(organizationName)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.gray)
                            }
                            
                            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                                Text(phoneNumber)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.blue)
                            }
                            
                            if let emailAddress = contact.emailAddresses.first?.value as String? {
                                Text(emailAddress)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.blue)
                            }
                            
                            // ... Display other contact details as desired
                        }
                    }
                }
                // Display container type 3 (iCloud) contacts
                Section(header: Text("iCloud Kontakte (\(container3Contacts.count) contacts)").font(.custom("Ubuntu-Bold", size: 10)).foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))) {
                    List(container3Contacts, id: \.self) { contact in
                        VStack(alignment: .leading) {
                            Text("\(contact.givenName) \(contact.familyName)")
                                .font(.custom("Ubuntu-Bold", size: 10))
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .font(.headline)
                            
                            if let organizationName = contact.organizationName {
                                Text(organizationName)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.gray)
                            }
                            
                            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                                Text(phoneNumber)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.blue)
                            }
                            
                            if let emailAddress = contact.emailAddresses.first?.value as String? {
                                Text(emailAddress)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.blue)
                            }
                            
                            // ... Display other contact details as desired
                        }
                    }
                }
                
                // Display container type 2 contacts
                Section(header: Text("Exchange Kontakte (\(container2Contacts.count) contacts)").font(.custom("Ubuntu-Bold", size: 10)).foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))) {
                    List(container2Contacts, id: \.self) { contact in
                        VStack(alignment: .leading) {
                            Text("\(contact.givenName) \(contact.familyName)")
                                .font(.custom("Ubuntu-Bold", size: 10))
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .font(.headline)
                            
                            if let organizationName = contact.organizationName {
                                Text(organizationName)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.gray)
                            }
                            
                            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                                Text(phoneNumber)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.blue)
                            }
                            
                            if let emailAddress = contact.emailAddresses.first?.value as String? {
                                Text(emailAddress)
                                    .font(.custom("Ubuntu-Bold", size: 10))
                                    .foregroundColor(.blue)
                            }
                            
                            // ... Display other contact details as desired
                        }
                    }
                }
                HStack{
                NavigationLink(destination: ContactDeletionView(container1Contacts: container1Contacts, container3Contacts: container3Contacts)) {
                    Text("bestimmte Kontakt löschen")
                        .font(.custom("Ubuntu-Bold", size: 10))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 238/255, green: 82/255, blue: 83/255))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button(action: {
                    performSync() // Call the sync function on button tap
                }) {
                    Text("synchronisieren")
                }
                .font(.custom("Ubuntu-Bold", size: 10))
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 46/255, green: 134/255, blue: 222/255)) // Change the background color here
                .cornerRadius(10)
            }.padding()//hstack
            }//vstack
            .onAppear {
                fetchAddressBooks()
            }
            .navigationBarItems(leading:
                            HStack {
                                Image("TG-Logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:70 , height: 30) // Adjust the image size as needed
                            }
                        )
            .alert(isPresented: $showAlert) {
                        if syncContactsCount > 0 {
                            return Alert(
                                title: Text("Synchronisierung abgeschlossen").font(.custom("Ubuntu-Bold", size: 10)),
                                message: Text("Der Synchronisierungsvorgang war erfolgreich.").font(.custom("Ubuntu-Regular", size: 8)).foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255)),
                                dismissButton: .default(Text("OK").font(.custom("Ubuntu-Bold", size: 10)))
                            )
                        } else {
                            return Alert(
                                title: Text("Synchronisierung bereits durchgeführt").font(.custom("Ubuntu-Bold", size: 10)),
                                message: Text("Es wurden keine Kontakte gelöscht, da die Synchronisierung bereits durchgeführt wurde.").font(.custom("Ubuntu-Reguar", size: 8)).foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255)),
                                dismissButton: .default(Text("OK").font(.custom("Ubuntu-Bold", size: 10)))
                            )
                        }
                    }
            
        }
    }
        
  
    func fetchAddressBooks() {
        // Clear the previous contacts
        container1Contacts = []
        container2Contacts = []
        container3Contacts = []
        
        let store = CNContactStore()
        var containerResults: [CNContainer] = []
        
        do {
            let allContainers = try store.containers(matching: nil)
            containerResults.append(contentsOf: allContainers)
            
            for container in containerResults {
                print("Container Name: \(container.name)", "Type: \(container.type.rawValue.description)")
                
                // Fetch contacts for the container
                let keysToFetch: [CNKeyDescriptor] = [
                    CNContactGivenNameKey as CNKeyDescriptor,
                    CNContactFamilyNameKey as CNKeyDescriptor,
                    CNContactOrganizationNameKey as CNKeyDescriptor,
                    CNContactPhoneNumbersKey as CNKeyDescriptor,
                    CNContactEmailAddressesKey as CNKeyDescriptor,
                    CNContactUrlAddressesKey as CNKeyDescriptor
                ]
                let request = CNContactFetchRequest(keysToFetch: keysToFetch)
                
                let containerId = container.identifier
                let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
                request.predicate = predicate
                
                DispatchQueue.global(qos: .userInitiated).async {
                    do {
                        try store.enumerateContacts(with: request) { contact, _ in
                            // Store contacts in the appropriate arrays based on container type
                            DispatchQueue.main.async {
                                switch container.type {
                                case .local:
                                    container1Contacts.append(contact)
                                case .exchange:
                                    container2Contacts.append(contact)
                                case .cardDAV:
                                    container3Contacts.append(contact)
                                default:
                                    break
                                }
                            }
                        }
                    } catch {
                        print("Error fetching contacts: \(error)")
                    }
                }
            }
        } catch {
            print("Error fetching address books: \(error)")
        }
    }
    func performSync() {
        let container2ContactIdentifiers = Set(container2Contacts.map { $0.identifier })
        
        let store = CNContactStore()
        let deleteRequest = CNSaveRequest()
        
        for contact in container1Contacts + container3Contacts {
            if container2ContactIdentifiers.contains(contact.identifier) {
                deleteRequest.delete(contact.mutableCopy() as! CNMutableContact)
            }
        }
        
        
        // Delete contacts from container type 1 or type 3 if they have the same phone number as contacts in container type 2
        for contact in container1Contacts + container3Contacts {
            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                if container2Contacts.contains(where: { $0.phoneNumbers.first?.value.stringValue == phoneNumber }) {
                    deleteRequest.delete(contact.mutableCopy() as! CNMutableContact)
                }
            }
        }
        
        // Delete contacts from container type 1 or type 3 with specific organization names
        let organizationNamesToDelete: Set<String> = [
            "Ralf Teichmann GmbH",
            "TeichmannGruppe",
            "Brunnhuber Krane GmbH",
            "Brunnhuber Eisenhüttenstadt GmbH",
            "KRAFOTEC GmbH",
            "Cranetech AG",
            "Cranetech GmbH"
        ]
        
        for contact in container1Contacts + container3Contacts {
            let trimmedOrganizationName = contact.organizationName.trimmingCharacters(in: .whitespacesAndNewlines)
            if organizationNamesToDelete.contains(trimmedOrganizationName) {
                deleteRequest.delete(contact.mutableCopy() as! CNMutableContact)
            }
        }
        
        // Delete contacts from container type 1 or type 3 if they have specific email domains
        for contact in container1Contacts + container3Contacts {
                if containsSpecificEmailDomain(contact: contact as CNContact) {
                    deleteRequest.delete(contact.mutableCopy() as! CNMutableContact)
                }
            }
        
        do {
            try store.execute(deleteRequest)
            print("Sync completed successfully.")
            print("Container 1 Contacts after sync:")
            print(container1Contacts)
            print("Container 3 (iCloud) Contacts after sync:")
            print(container3Contacts)
            syncContactsCount = container1Contacts.count + container3Contacts.count
            // Update the sync contacts count
            showAlert = true
        } catch {
            print("Error deleting contacts: \(error)")
        }
    }
    
    
    func containsSpecificEmailDomain(contact: CNContact) -> Bool {
        let emailDomainsToDelete: Set<String> = [
            "brunnhuber.de",
            "cranetech.de",
            "krafotec.de",
            "teichmann-krane.de",
            "teichmanngruppe.de",
            "cranetech.ch"
        ]

        for emailAddress in contact.emailAddresses {
            if let email = emailAddress.value as String?,
               let emailComponents = email.components(separatedBy: "@").last,
               emailDomainsToDelete.contains(emailComponents.lowercased()) {
                return true
            }
        }

        return false
    }




    
}

extension CNContact: Identifiable {}
