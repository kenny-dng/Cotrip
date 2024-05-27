//
//  ContentView.swift
//  Favoris
//
//  Created by apprenant95 on 03/07/2023.
//
import SwiftUI

struct Favoris: View {
    @State private var searchText = ""
    
    let logement = Logement(image: "calanques", name:"Les calanques", prix: "400€/pers", description1: "Proche du Plage", description2: """
                 Découvrez les merveilles des calanques, un trésor naturel niché sur la côte méditerranéenne.
                 \nLes calanques sont de véritables joyaux de la nature, offrant un paysage à couper le souffle où les montagnes escarpées rencontrent les eaux cristallines de la mer. Imaginez des falaises calcaires imposantes se jetant dans des criques isolées, formant des anses secrètes bordées de plages de sable fin. Ce paradis préservé est un refuge pour une biodiversité unique.
                 """)
                            
    var body: some View {
        NavigationView {
            ZStack {
                Image("Skychat")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "trash")
                                .font(.system(size: 24))
                                .opacity(0)
                            Spacer()
                            Text("Mes Favoris")
                                .foregroundColor(.white)
                                .font(.title)
                                .bold()
                            
                            Spacer()
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .foregroundColor(.white)
                                .opacity(0.7)
                                .font(.system(size: 24))
                        }
                        SearchBar1(searchText: $searchText)
                        Divider()
                            .background(.white)
                            .padding(.vertical, 5)
                    
                    VStack {
                        ForEach(voyagesEnCours1.filter { searchText.isEmpty || $0.destination.localizedCaseInsensitiveContains(searchText) }) { voyage in
                            if voyage.isClickable {
                                NavigationLink(destination: DetailLogement(logement: logement)) {
                                    Voyage1(destination: voyage.destination, date: voyage.date, image: voyage.image)
                                }
                            } else {
                                Voyage1(destination: voyage.destination, date: voyage.date, image: voyage.image)
                            }
                        }
                    }
                   
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}


struct SearchBar1: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("\(Image(systemName: "magnifyingglass")) Rechercher dans mes favoris", text: $searchText)
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

struct Voyage1: View {
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
                    .foregroundColor(.black)
                
                Text("Date \(date)")
                    .font(.body)
                    .foregroundColor(.gray)
            } .padding(5)
            
            Spacer()
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size:30))
        }
        .padding()
        .background()
        .cornerRadius(10)
    }
}

let voyagesEnCours1 = [
    VoyageData(destination: "Les calanques", date: ": Aout 2023", image: "calanques", isClickable: true),
    VoyageData(destination: "Paris", date: ": Juillet 2023", image: "Paris", isClickable: false),
    VoyageData(destination: "Limoges", date: "03/06/2023", image: "Limoges", isClickable: false),
    VoyageData(destination: "Strasbourg", date: "15/06/2023", image: "Strasbourg", isClickable: false),
    VoyageData(destination: "Lyon", date: "25/06/2023", image: "Lyon", isClickable: false),
]

struct Favoris_Previews: PreviewProvider {
    static var previews: some View {
        Favoris()
    }
}

