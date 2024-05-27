//
//  Test.swift
//  Aventure
//
//  Created by Apprenant 80 on 28/06/2023.
//

import SwiftUI

struct Logement: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var prix: String
    var description1: String
    var description2: String
}

let colorSet: Color = Color(hue: 0.554, saturation: 0.895, brightness: 0.386)

struct ResultatRecherche: View {
    @State private var isAscending = true

    @State private var logements: [Logement] = [
        Logement(image: "VillaJasmin", name:"Villa Jasmin", prix: "100€/pers", description1: "Proche du Plage Pereire", description2: """
                 La villa Jasmin se compose de un séjour agréable, 3 chambres confortables, 2 salles d'eau, une cuisine entièrement équipée ouverte sur le séjour et d'un jardin joliment décoré.
                 \rL'emplacement de la villa est idéal. À seulement 5 minutes en voiture, vous pourrez rejoindre la plage de Pereire ainsi que le centre d'Arcachon, où vous trouverez de nombreux restaurants, boutiques. Un grand Intermarché est à seulement 10 minutes en voiture. La plage est accessible en seulement 15 minutes à pied.
                 \rLe Bus 3 passe pas loin de la villa à la place Maydieu qui vous amène directement à la Dune du Pyla mais aussi à la gare d'Arcachon.
                 \rLe linge de maison est fourni pour tous les séjours de 7 nuits ou plus.\rPour tout séjour < 7 jours : un forfait obligatoire pour le linge et draps de bain au prix de 10 euros par personne.
                 """),
        Logement(image: "MaisonAzur", name:"Maison Azur", prix: "90€/pers", description1: "Au coeur du bassin", description2:"""
La maison est à 10 mètres de la plage, en face du bassins. Elle se compose d'un séjourn 2 chambres, d'une salle d'eau et une cuisine.
\rA 5mn de restaurants et tous commerces, à proximité de nombreuses activités terrestres et aquatiques. A 200 m de la gare, plage surveillée à 500 m, plages océanes à 18kms.
\rA disposition Nespresso, micro onde; linge non fourni Linge non fourni, le ménage doit être fait avant le départ.
"""),
        Logement(image: "TinyHouse", name:"Tiny House", prix: "85€/pers", description1: "Au coeur du bassin",description2:"""
Passer vos vacances en famille, au Teich au coeur du bassin d'Arcachon dans une maison de 50 m2 avec grande terrasse bois ombragée situer en centre ville tout près du parc ornithologique ,sentier du littoral.
\rA 5mn de restaurants et tous commerces, à proximité de nombreuses activités terrestres et aquatiques. A 200 m de la gare, plage surveillée à 500 m, plages océanes à 18kms.
\rA disposition Nespresso, micro onde; linge non fourni Linge non fourni, le ménage doit être fait avant le départ.
"""),
    ]
    
    var body: some View {
//        NavigationView {
            ZStack {
                Image("Skychat")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                VStack {
                    HStack(spacing: 30){
                        VStack {
                            Text("Destination")
                                .foregroundColor(.white)
                                .padding(1)
                            Text("Arcachon")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        VStack {
                            Text("Type")
                                .foregroundColor(.white)
                                .padding(1)
                            Text("Maison")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        VStack {
                            Text("Tout")
                                .foregroundColor(.white)
                                .padding(1)
                            Text("3")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        VStack {
                            Text("Flitre")
                                .foregroundColor(.white)
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.white)
                                .padding(.top,0.5)
                        }
                        .padding(.top, 5)
                    }
                    
                    ScrollView {
                        VStack {
                            ForEach(logements) { eachLogement in
                                NavigationLink(destination: DetailLogement (logement: eachLogement)) {
                                    HStack {
                                        Image(eachLogement.image)
                                            .resizable()
                                            .cornerRadius(10)
                                            .frame(width: 80, height: 80)
                                            .padding(.trailing,15)
                                            
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(eachLogement.name)
                                                    .font(.headline)
                                                    .foregroundColor(colorSet)
                                                Spacer()
                                                Text(eachLogement.prix)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                            
                                            Text(eachLogement.description1)
                                                .font(.subheadline)
                                                .foregroundColor(colorSet)
                                                .padding(.top,0.5)
                                        }
                                }
                                    .padding(15)
                                    .background(Color(.white))
                                    .cornerRadius(10)
                                }
                            } .padding(.horizontal, 20)
                                .padding(.vertical, 2.5)
                        }
//                    }
                }
            }
        }
    }
}

struct DetailLogement: View {
    @State private var isConfirmationVisible = false
    @State var rechercheMode : Bool = true
    var logement: Logement
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(logement.name)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(colorSet)
                    Spacer()
                    VStack (alignment: .trailing){
                        Text("15 au 22")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Text("Juillet 2023")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
                .padding(20)
                .padding(.bottom,-20)
                Image(logement.image)
                    .resizable()
                    .frame(height: 220)
                    .padding(.bottom,4)
                VoyageDetails()
                ZStack {
                    Color.white
                        .frame(height: 220)
                        .clipShape(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 20))
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .padding(.horizontal,20)
                    ScrollView {
                        Text(logement.description2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.clear)
                            .padding(20)
                    }
                }.padding(.bottom, -23)
                
                NavigationLink(destination: Connexion()) {
                    Text(rechercheMode ? "Réserver" : "Verrouiller le groupe")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(colorSet)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                                            .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 20))
                                            .padding(.bottom, 20)
                                            .padding(.horizontal, 3)
                }
            }
    }
    
    // Shape personnalisé pour les coins arrondis
    struct RoundedCornersShape: Shape {
        var corners: UIRectCorner
        var radius: CGFloat
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
}


struct VoyageDetails: View {
    let infos: [Info] = [
        Info(icon: "person.3.fill" ,label: "Participants", value: "2/6"),
        Info(icon: "house",label: "Type de logement", value: "Maison"),
        Info(icon: "eurosign",label: "Prix estimé", value: "100.00€/pers"),
    ]
    
    var body: some View {
        HStack {
            VStack(spacing: 8) {
                ForEach(infos, id:\.self) { info in
                    Image(systemName: info.icon)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                ForEach(infos, id:\.self) { info in
                    Text(info.label)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                ForEach(infos, id:\.self) { info in
                    Text(info.value)
                }
            }
        }
        .padding(.horizontal, 20)
        .font(.system(size: 16))
    }
}


struct ResultatRecherche_Previews: PreviewProvider {
    static var previews: some View {
        ResultatRecherche()
    }
}
