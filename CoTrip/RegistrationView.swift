//
//  RegistrationView.swift
//  CoTrip
//
//  Created by Kenny DUONG on 05/07/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var dateOfBirth: Date = Date()
    @State private var countryOfBirth: String = ""
    
    var body: some View {
        VStack {
            TextField("Nom", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Prenom", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Numéro de téléphone", text: $phoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Date de naissance", selection: $dateOfBirth, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
            
            TextField("Pays de naissance", text: $countryOfBirth)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                // je peux jouter ici la logique de traitement des coordonnées
                print("Nom: \(name)")
                print("Email: \(email)")
                print("Numéro de téléphone: \(phoneNumber)")
                print("Date de naissance: \(dateOfBirth)")
                print("Pays de naissance: \(countryOfBirth)")
            }) {
                Text("Valider")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarTitle("Inscription")
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
