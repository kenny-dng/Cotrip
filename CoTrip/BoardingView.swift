//
//  ContentView.swift
//  CoTripNina
//
//  Created by apprenant95 on 25/06/2023.
//

import SwiftUI

struct Boarding: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Skychat")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "archivebox")
                            .font(.system(size: 24))
                            .opacity(0)
                        Spacer()
                        Text("Tableau de bord")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "archivebox")
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .font(.system(size: 24))
                    }
                    .padding(.horizontal)
                    
                    SearchBar(searchText: $searchText)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    
                    List {
                        Section(header: Text("Voyages en cours").font(.callout)) {
                            ForEach(voyagesEnCours.filter { searchText.isEmpty || $0.destination.localizedCaseInsensitiveContains(searchText) }) { voyage in
                                if voyage.isClickable {
                                    NavigationLink(destination: DetailLogement(rechercheMode: false, logement: logement)) {
                                        Voyage(destination: voyage.destination, date: voyage.date, image: voyage.image)
                                    }
                                } else {
                                    Voyage(destination: voyage.destination, date: voyage.date, image: voyage.image)
                                }
                            }
                        }
                        Section(header: Text("Voyages terminés").font(.callout)) {
                            ForEach(voyagesPasses.filter { searchText.isEmpty || $0.destination.localizedCaseInsensitiveContains(searchText) }) { voyage in
                                Voyage(destination: voyage.destination, date: voyage.date, image: voyage.image)
                            }
                        }
                    }.background(.clear)
                    Spacer()
                }
            }
        }
    }
}


struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("\(Image(systemName: "magnifyingglass")) Rechercher un voyage", text: $searchText)
                .padding()
                .frame(height: 45)
                .background()
                .cornerRadius(10)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                .font(.title3)
                .opacity(0.8)
        }
    }
}

struct Voyage: View {
    var destination: String
    var date: String
    var image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(destination)
                    .font(.title3)
                
                Text("Date \(date)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(5)
        }
        .padding(5)
    }
}

let logement = Logement(image: "Paris_2", name:"Séjour à Paris", prix: "150€/pers", description1: "Proche de la tour eiffel",
         description2: """
Découvrez Paris lors d'un circuit culturel passionnant ! Plongez-vous dans l'histoire et l'art de cette magnifique ville. \nVisitez des monuments emblématiques tels que la Tour Eiffel, le Louvre et Notre-Dame.
"""  )

let voyagesEnCours = [
    VoyageData(destination: "Paris", date: "12/07/2023", image: "Paris3", isClickable: true),
    VoyageData(destination: "Marseille", date: "18/07/2023", image: "Marseille", isClickable: false)
]

let voyagesPasses = [
    VoyageData(destination: "Limoges", date: "03/06/2023", image: "Limoges"),
    VoyageData(destination: "Strasbourg", date: "15/06/2023", image: "Strasbourg"),
    VoyageData(destination: "Lyon", date: "25/06/2023", image: "Lyon"),
]

struct VoyageData: Identifiable, Hashable {
    var id = UUID()
    var destination: String
    var date: String
    var image: String
    var isClickable: Bool = false
}


struct Boarding_Previews: PreviewProvider {
    static var previews: some View {
        Boarding()
    }
}

