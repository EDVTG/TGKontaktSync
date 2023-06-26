//
//  ContactDeletionView.swift
//  TGKontaktSync
//
//  Created by edv on 25.06.23.
//

import SwiftUI
import Contacts

struct ContactDeletionView: View {
    @State private var phoneNumberToDelete: String = ""
    @State private var deletedContactsCount: Int = 0
    
    let container1Contacts: [CNContact]
    let container3Contacts: [CNContact]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
   
        VStack {
            TextField("Telefonnummer eingeben", text: $phoneNumberToDelete)
                .font(.custom("Ubuntu-Bold", size: 15))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                deleteContacts()
            }) {
                Text("Kontakt löschen")
                    .font(.custom("Ubuntu-Bold", size: 18))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 238/255, green: 82/255, blue: 83/255))
                    .cornerRadius(10)
            }
            .padding()
            
            Text("gelöschte Kontakte: \(deletedContactsCount)")
                .font(.custom("Ubuntu-Bold", size: 15))
                .foregroundColor(.gray)
                .padding(.bottom)
            Button(action: {
                           presentationMode.wrappedValue.dismiss()
                       }) {
                           Text("Zurück zur Sync")
                               .font(.custom("Ubuntu-Bold", size: 15))
                               .foregroundColor(Color(red: 46/255, green: 134/255, blue: 222/255))
                               .padding()
                       }
        }
        
        .navigationBarItems(leading:
                        HStack {
                            Image("TG-Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:70 , height: 30) // Adjust the image size as needed
                        }
                    )
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            // Clear the phone number and count when leaving the view
            phoneNumberToDelete = ""
            deletedContactsCount = 0
        }
        
    }
    
    func deleteContacts() {
        let store = CNContactStore()
        let deleteRequest = CNSaveRequest()
        
        let allContacts = container1Contacts + container3Contacts
        let contactsToDelete = allContacts.filter { contact in
            if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                return phoneNumber == phoneNumberToDelete
            }
            return false
        }
        
        for contact in contactsToDelete {
            deleteRequest.delete(contact.mutableCopy() as! CNMutableContact)
        }
        
        do {
            try store.execute(deleteRequest)
            deletedContactsCount = contactsToDelete.count
        } catch {
            print("Error deleting contacts: \(error)")
        }
    }
}
