//
//  ContentView.swift
//  Nouveau
//
//  Created by apprenant95 on 04/07/2023.
//

import SwiftUI

struct Recherche: View {
    
    @State private var confirmationAnimation = false
    
    @State private var click1 : Bool = false
    @State private var click2 : Bool = false
    @State private var click3 : Bool = false
    
    @State var depart: String = ""
    @State var destination: String = ""
    
    @State private var arrivalDate = Date()
    @State private var departureDate = Date()
    
    @State private var selectedTypeTransport = ""
    let typeTransports = ["Voiture", "Autocar", "Camping Car", "Vol"]
    @State private var selectedGroupTransport = ""
    let groupTransports = ["Indifférent", "Femme seule", "Famille avec enfant"]
    
    @State private var selectedTypeHebergement = ""
    let typeHebergements = ["Appartment", "Maison"]
    @State private var selectedGroupHebergement = ""
    let groupHebergements = ["Indifférent","Etudiant","Retraité", "Femme seule", "Famille avec enfant"]
    
    @State private var selectedTypeActivite = ""
    let typeActivites = ["Sport", "Culture", "Gastronomie"]
    @State private var selectedGroupActivite = ""
    let groupActivites = ["Indifférent","Etudiant","Retraité", "Femme seule", "Famille avec enfant"]
    
    @State private var isOptionVisible = false
    @State private var selectedOptions: Set<String> = []
    
    let optionTransports = [
        "PMR",
        "Animal autorisé"
    ]
    let optionHebergements = [
        "PMR",
        "Végétarien",
        "Animal autorisé"
    ]
    let optionActivites = [
        "PMR",
        "Végétarien",
        "Animal autorisé"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Skychat")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
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
                    
                    if !click1 && !click2 && !click3 {
                        Image("eiffel")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .rotation3DEffect(.degrees(confirmationAnimation ? 360 : 0), axis: (x: 0, y: 0, z: 9))
                            .onAppear {
                                withAnimation(Animation.linear(duration: 50).repeatForever(autoreverses: false)) {
                                    confirmationAnimation.toggle()
                                }
                            }
                            .padding()
                        
                    }
                    
                    VStack {
                        HStack(spacing: 30) {
                            Buttonoption(icon: "car.circle.fill", button: "Transport", click1Status: true, click2Status: false, click3Status: false, clickStatus: $click1, click1: $click1, click2: $click2, click3: $click3)
                            Buttonoption(icon: "house.circle.fill", button: "Logement", click1Status: false, click2Status: true, click3Status: false, clickStatus: $click2, click1: $click1, click2: $click2, click3: $click3)
                                .padding(.trailing, 3)
                            Buttonoption(icon: "figure.walk.circle.fill", button: "Activité", click1Status: false, click2Status: false, click3Status: true, clickStatus: $click3, click1: $click1, click2: $click2, click3: $click3)
                        }
                        .padding(.top, 30)
                        Spacer()
                        if click1 == true {
                            List {
                                
                                TextField("Départ", text: $depart, prompt: Text("Départ").foregroundColor(.black))
                                TextField("Destination", text: $destination, prompt: Text("Destination").foregroundColor(.black))
                                DatePicker(
                                    "Date",
                                    selection: $departureDate,
                                    displayedComponents: [.date]
                                )
                                HStack {
                                    Text("Type")
                                    Spacer()
                                    Picker("", selection: $selectedTypeTransport) {
                                        ForEach(typeTransports, id: \.self) { type in
                                            Text(type).tag(type)
                                        }
                                    }
                                }
                                HStack {
                                    Text("Groupe")
                                    Spacer()
                                    Picker("", selection: $selectedGroupTransport) {
                                        ForEach(groupTransports, id: \.self) { type in
                                            Text(type).tag(type)
                                        }
                                    }
                                }
                                HStack {
                                    Text("Option")
                                    Spacer()
                                    Button(action: {
                                        isOptionVisible.toggle()
                                    }) {
                                        Image(systemName: isOptionVisible ? "chevron.down" : "chevron.down")
                                            .rotationEffect(isOptionVisible ? .degrees(90) : .degrees(0))
                                            .foregroundColor(.gray)
                                    }
                                }
                                if isOptionVisible {
                                    ForEach(optionTransports, id: \.self) { option in
                                        Toggle(option, isOn: toggleBinding(for: option))
                                            .toggleStyle(CheckboxToggleStyle2())
                                    }
                                }
                                NavigationLink(destination: ResultatRecherche()) {
                                    HStack {
                                        Spacer()
                                        Text("Rechercher")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        Spacer()
                                    }
                                }
                                .listRowBackground(Color(.orange))
                            }
                        }
                        
                        if click2 == true {
                            //                    NavigationView {
                            List {
                                TextField("Destination", text: $destination, prompt: Text("Destination").foregroundColor(.black))
                                DatePicker(
                                    "Arrivée",
                                    selection: $arrivalDate,
                                    displayedComponents: [.date]
                                )
                                DatePicker(
                                    "Départ",
                                    selection: $departureDate,
                                    displayedComponents: [.date]
                                )
                                HStack {
                                    Text("Type")
                                    Spacer()
                                    Picker("", selection: $selectedTypeHebergement) {
                                        ForEach(typeHebergements, id: \.self) { type in
                                            Text(type).tag(type)
                                        }
                                    }
                                }
                                HStack {
                                    Text("Groupe")
                                    Spacer()
                                    Picker("", selection: $selectedGroupHebergement) {
                                        ForEach(groupHebergements, id: \.self) { type in
                                            Text(type).tag(type)
                                        }
                                    }
                                }
                                HStack {
                                    Text("Option")
                                    Spacer()
                                    Button(action: {
                                        isOptionVisible.toggle()
                                    }) {
                                        Image(systemName: isOptionVisible ? "chevron.down" : "chevron.down")
                                            .rotationEffect(isOptionVisible ? .degrees(90) : .degrees(0))
                                            .foregroundColor(.gray)
                                    }
                                }
                                if isOptionVisible {
                                    ForEach(optionHebergements, id: \.self) { option in
                                        Toggle(option, isOn: toggleBinding(for: option))
                                            .toggleStyle(CheckboxToggleStyle2())
                                    }
                                }
                                NavigationLink(destination: ResultatRecherche()) {
                                    HStack {
                                        Spacer()
                                        Text("Rechercher")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        Spacer()
                                    }
                                }.listRowBackground(Color(.orange))
                            }
                        }
                        //                }
                        if click3 == true {
                            //                    NavigationView {
                            List {
                                TextField("Destination", text: $destination, prompt: Text("Ville").foregroundColor(.black))
                                DatePicker(
                                    "Date",
                                    selection: $arrivalDate,
                                    displayedComponents: [.date]
                                )
                                HStack {
                                    Text("Type")
                                    Spacer()
                                    Picker("", selection: $selectedTypeActivite) {
                                        ForEach(typeActivites, id: \.self) { type in
                                            Text(type).tag(type)
                                        }
                                    }
                                }
                                HStack {
                                    Text("Groupe")
                                    Spacer()
                                    Picker("", selection: $selectedTypeActivite) {
                                        ForEach(groupActivites, id: \.self) { type in
                                            Text(type).tag(type)
                                        }
                                    }
                                }
                                HStack {
                                    Text("Option")
                                    Spacer()
                                    Button(action: {
                                        isOptionVisible.toggle()
                                    }) {
                                        Image(systemName: isOptionVisible ? "chevron.down" : "chevron.down")
                                            .rotationEffect(isOptionVisible ? .degrees(90) : .degrees(0))
                                            .foregroundColor(.gray)
                                    }
                                }
                                if isOptionVisible {
                                    ForEach(optionActivites, id: \.self) { option in
                                        Toggle(option, isOn: toggleBinding(for: option))
                                            .toggleStyle(CheckboxToggleStyle2())
                                    }
                                }
                                NavigationLink(destination: ResultatRecherche()) {
                                    HStack {
                                        Spacer()
                                        Text("Rechercher")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                        Spacer()
                                    }
                                }.listRowBackground(Color(.orange))
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    private func toggleBinding(for option: String) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                selectedOptions.contains(option)
            },
            set: { newValue in
                if newValue {
                    selectedOptions.insert(option)
                } else {
                    selectedOptions.remove(option)
                }
            }
        )
    }
    
    
    struct CheckboxToggleStyle2: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            return HStack {
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .onTapGesture {
                        configuration.isOn.toggle()
                    }
            }
        }
    }
    
    struct Recherche_Previews: PreviewProvider {
        static var previews: some View {
            Recherche()
        }
    }
    
    struct Buttonoption: View {
        let colorSet: Color = Color(hue: 0.554, saturation: 0.895, brightness: 0.386)
        var icon: String
        var button: String
        var click1Status: Bool
        var click2Status: Bool
        var click3Status: Bool
        @Binding var clickStatus: Bool
        @Binding var click1: Bool
        @Binding var click2: Bool
        @Binding var click3: Bool
        
        var body: some View {
            HStack {
                Button {
                    clickStatus.toggle()
                    click2 = click2Status
                    click3 = click3Status
                    click1 = click1Status
                } label: { VStack {
                    Image(systemName: icon)
                        .font(.system(size: 50))
                        .foregroundColor((click1 == false && click2 == false && click3 == false) ? .white : clickStatus ? .orange : .white)
                    
                    Text(button)
                        .foregroundColor  ((click1 == false && click2 == false && click3 == false) ? .white : clickStatus ? .orange : .white)
                }
                .padding(.top, 15)
                }
            }
        }
    }
}
