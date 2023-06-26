//
//  ContentView.swift
//  TGKontaktSync
//
//  Created by edv on 22.06.23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Teichmann Kontaktsynchronisation")
                        .font(.custom("Ubuntu-Bold", size: 25))
                        .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                        .frame(maxWidth:.infinity, alignment: .topLeading)
                    VStack{
                            Text("Backup:")
                                .font(.custom("Ubuntu-Bold", size: 15))
                                .frame(maxWidth:.infinity, alignment: .topLeading)
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .padding()
                            
                            Text("Sichern Sie Ihr iPhone bitte zuerst in der iCloud.")
                                .font(.custom("Ubuntu-Regular", size: 15))
                                .frame(maxWidth:.infinity, alignment: .leading)
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .padding()
                            
                            Text("Kontakte bereinigen:")
                                .font(.custom("Ubuntu-Bold", size: 15))
                                .frame(maxWidth:.infinity, alignment: .leading)
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .padding()
                            
                            Text("Um die App zu verwenden, klicken Sie auf „Sync“ Seite, wenn Sie doppelte Kontakte sehen, auf den Button „synchronisieren“ \ndrücken und warten Sie, bis alle doppelten Kontakte gelöscht sind. Nachdem die Kontakte gelöscht wurden, müssen Sie bis zum nächsten Tag warten. Über Nacht werden die fehlenden Kontakte wieder zu Ihrem Konto hinzugefügt.")
                                .font(.custom("Ubuntu-Regular", size: 15))
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .multilineTextAlignment(.leading)
                                .padding()
                            
                            Text("Löschen über Telefonnummern:")
                                .font(.custom("Ubuntu-Bold", size: 15))
                                .frame(maxWidth:.infinity, alignment: .leading)
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .padding()
                        
                            Text("Falls Sie nach der Bereinigung doppelte Kontakte sehen sollten, klicken Sie einfach auf den Button „Bestimmten Kontakt löschen“. Geben Sie die Nummer des gewünschten Kontakts ein und drücken den Button „Kontakt löschen“. Alle Kontakte mit dieser Nummer sind somit lokal komplett gelöscht. Jedoch werden die aktuellen Kontakte über Nacht wieder auf Ihr Handy eingespielt. Wenn Sie jedoch die Kontakte sofort benötigen, kontaktieren Sie bitte uns.")
                                .font(.custom("Ubuntu-Regular", size: 15))
                                .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                .multilineTextAlignment(.leading)
                                .padding()
                        Text("Support:")
                                    .font(.custom("Ubuntu-Bold", size: 15))
                                    .frame(maxWidth:.infinity, alignment: .leading)
                                    .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                                    .padding()
                        Text("bakhshian.i@teichmanngruppe.de\n0201 83455-442\nedv@teichmanngruppe.de ")
                            .font(.custom("Ubuntu-Regular", size: 15))
                            .foregroundColor(Color(red: 34/255, green: 47/255, blue: 62/255))
                            .frame(maxWidth:.infinity, alignment: .leading)
                            .padding()
                        }
                    .background(Color(red: 241/255, green: 242/255, blue: 246/255))
                    
                    Spacer() // Add a spacer to push the watermark to the bottom
                    Text("Provided by TeichmannGruppe")
                        .font(.custom("Ubuntu-Regular", size: 12))
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                }
            }
            .navigationBarItems(leading:
                HStack {
                    Image("TG-Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 30)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

