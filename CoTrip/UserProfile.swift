//
//  UserProfile.swift
//  CoTrip
//
//  Created by Kenny DUONG on 20/06/2023.
//

import SwiftUI

struct Info: Hashable{
//    var id = UUID()
    var icon: String
    var label: String
    var value: String
}

struct Comment: Identifiable {
    var id = UUID()
    var username: String
    var message: String
}

struct ProfileTab: View {
    @State private var likes: Int = 207
    @State private var onglet = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image("Paris")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.top)
                VStack(alignment: .trailing) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .bold()
                        .multilineTextAlignment(.trailing)
                        .padding(.top, -70)
                        .padding(.trailing, 20)
                    
                    HStack {
                        InfoLabel(count: likes, icon: "heart.fill", colorIcon: .red, label: "ont aimé")
                            .offset(x: 30, y: 65)
                        Avatar()
                        InfoLabel(count: 86, icon: "map.fill", colorIcon: .blue, label: "voyages")
                            .offset(x: -30, y: 65)
                    }
                }
            }
            
            Text("Ariana")
                .font(.title)
                .foregroundColor(.black)
            Text("Los Angeles, 24 ans")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Picker(selection: $onglet, label: Text("")) {
                Text("Information")
                    .tag(0)
                Text("Avis")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 7)
            
            Divider().padding(5)
            
            if onglet == 0 {
                Information()
            } else {
                Commentaire()
            }
            Spacer()
        }
    }
}

struct InfoLabel: View {
    var count: Int
    var icon: String
    var colorIcon: Color
    var label: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(colorIcon)
                Text("\(count)")
                    .bold()
            }
            Text(label)
                .foregroundColor(.gray)
        }
    }
}

struct Avatar: View {
    var body: some View {
        ZStack {
            Image("ariana-grande0")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .clipShape(Circle())
                .shadow(color: .white, radius: 5)
            
            Rectangle()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .cornerRadius(5)
                .offset(x: 40, y:60)
            
            Image(systemName: "checkmark.shield.fill")
                .resizable()
                .frame(width: 25, height: 30)
                .foregroundColor(.green)
                .offset(x: 40, y:60)
        }
    }
}

struct Information: View {
    let infos: [Info] = [
        Info(icon: "person.text.rectangle" ,label: "Genre", value: "Femme"),
        Info(icon: "thermometer.medium",label: "Personnalité", value: "Introvertie"),
        Info(icon: "music.note.list",label: "Musique", value: "Pop, RnB"),
        Info(icon: "fork.knife",label: "Régime", value: "Vegan"),
        Info(icon: "exclamationmark.triangle",label: "Allergies", value: "Cacahuete"),
        Info(icon: "pawprint.fill",label: "Animaux", value: "J'adore"),
        Info(icon: "wind",label: "Fumeur", value: "Ne supporte pas la fumée"),
        Info(icon: "heart.circle",label: "Intérêts", value: "Randonnée, Culture")
    ]
    
    var body: some View {
        HStack {
            VStack(spacing: 20) {
                ForEach(infos, id:\.self) { info in
                    Image(systemName: info.icon)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading, spacing: 20) {
                ForEach(infos, id:\.self) { info in
                    Text(info.label)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 20) {
                ForEach(infos, id:\.self) { info in
                    Text(info.value)
                }
            }
        }
        .padding(.horizontal)
        .font(.system(size: 18))
    }
}

struct Commentaire: View {
    let comments: [Comment] = [
            Comment(username: "John", message: "Super bonne compagnie !"),
            Comment(username: "Alice", message: "J'ai adoré mon séjour avec elle !"),
            Comment(username: "Mark", message: "Personne agréable, facile à vivre !"),
            Comment(username: "Roxanne", message: "Trop cool le covoiturage Karaoke"),
        ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading)  {
                ForEach(comments) { comment in
                    HStack {
                        Image(comment.username)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .clipShape(Circle())
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text(comment.username)
                                .font(.headline)
                            Text(comment.message)
                                .font(.subheadline)
                        }
                        Spacer()
                    }
                    .frame(width: 300)

                    Divider()
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab()
    }
}
