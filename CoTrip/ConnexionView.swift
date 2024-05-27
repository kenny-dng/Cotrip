//
//  ContentView.swift
//  Aventure
//
//  Created by apprenant76 on 20/06/2023.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "Ariana"
let storedPassword = "Grande"

struct Connexion: View {
    @State private var confirmationAnimation = false
    @State var username: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    
    var body: some View {
            ZStack {
                Image("Sky")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Text("CoTrip")
                        .font(.largeTitle) // Ajustez la taille de police selon vos préférences
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hue: 0.068, saturation: 0.033, brightness: 0.982, opacity: 0.981))
                    
                    Text("Go cheap")
                        .font(.title) // Ajustez la taille de police selon vos préférences
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hue: 0.068, saturation: 0.033, brightness: 0.982, opacity: 0.981))
                    
                    Image("eiffel")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(.degrees(confirmationAnimation ? 360 : 0), axis: (x: 0, y: 0, z: 9))
                        .onAppear {
                            withAnimation(Animation.linear(duration: 50).repeatForever(autoreverses: false)) {
                                confirmationAnimation.toggle()
                            }
                        }
                        .padding(.bottom)
                    
                    TextField(("Identifiant"),text: $username)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(10)
                        .opacity(0.8)
                    
                    SecureField("Mot de passe", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .opacity(0.8)
                    
                    if authenticationDidFail {
                        Text("Information incorrecte. Réessayer.")
                            .foregroundColor(.white)
                    }
                    
                    HStack (alignment: .center){
                        NavigationLink(destination: Paiement()) {
                                Text("CONNEXION")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 150, height: 40)
                                    .background(Color.orange)
                                    .cornerRadius(35.0)
                            }
                        
                        NavigationLink(destination: RegistrationView()) {
                            Text("INSCRIPTION")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 150, height: 40)
                                .background(Color.orange)
                                .cornerRadius(35.0)
                        }
                    }
                    NavigationLink(destination: RegistrationView()) {
                        Text("Mot de passe oublié ?")
                            .foregroundColor(.blue)
                            .padding(10)
                    }
                    ZStack {
                        Divider()
                            .overlay(.white)
                        Text("Se connecter avec")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom)
                    Icon()
                    
                }
                .padding()
            }
        }
    }

struct Connexion_Previews: PreviewProvider {
    static var previews: some View {
        Connexion()
    }
}

struct Icon: View {
    var body: some View {
        HStack(spacing: 40) {
            Image("Facebook")
                .resizable()
                .frame(width: 50, height: 50)
            Image("Apple")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(15)
            Image("Gmail")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(20)
        }
    }
}

