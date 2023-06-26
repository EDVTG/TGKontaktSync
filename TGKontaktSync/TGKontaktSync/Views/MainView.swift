//
//  MainView.swift
//  TGKontaktSync
//
//  Created by edv on 25.06.23.
//



import SwiftUI
import Contacts

struct MainView: View {
    
    @State private var containers: [CNContainer] = []
    @State private var container1Contacts: [CNContact] = []
    @State private var container2Contacts: [CNContact] = []
    @State private var container3Contacts: [CNContact] = []
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Label("Anleitung",systemImage: "book.fill")
                }.padding()
            AddressBookSync()
                .tabItem{
                    Label("Sync",systemImage: "wrench.fill")
                }.padding()
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Switch())
    }
}

