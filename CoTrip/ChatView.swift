//
//  ContentView.swift
//  TDBChatting
//
//  Created by apprenant95 on 29/06/2023.
//
import SwiftUI

// Identification des discussions disponibles >>>>>>>>>>>>>>>>>>>>>>>>>>>>

struct Conversation: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let isClickable: Bool
}

struct DashboardView: View {
    @State private var searchText = ""
    
    let conversations: [Conversation] = [
        Conversation(name: "Allons à Limoges!", imageName: "woman", isClickable: false),
        Conversation(name: "Strasbourg", imageName: "istockphoto", isClickable: false),
        Conversation(name: "C'est Marseille bébé", imageName: "anabelle", isClickable: false),
        Conversation(name: "Voyage à la capitale !", imageName: "stephanie", isClickable: true),
        Conversation(name: "Lille entre femmes", imageName: "tenus", isClickable: false),
    ]
    
    var filteredConversations: [Conversation] {
        if searchText.isEmpty {
            return conversations
        } else {
            return conversations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Skychat")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                VStack (alignment: .leading) {
                    HStack{
                        Image(systemName: "trash")
                            .font(.system(size: 24))
                            .opacity(0)
                        Spacer()
                        Text("Messagerie")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .font(.system(size: 24))
                    }
                    SearchBannerView(searchText: $searchText)
                    Divider()
                        .background(.white)
                        .padding(.vertical, 5)
                    
                    VStack {
                        ScrollView {
                            ForEach(filteredConversations) { conversation in
                                if conversation.isClickable {
                                    NavigationLink(destination: ChatView(conversation: conversation)) {
                                        ConversationRowView(conversation: conversation)
                                    }
                                } else {
                                    ConversationRowView(conversation: conversation)
                                }
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

struct ConversationRowView: View {
    let conversation: Conversation
    
    var body: some View {
        HStack( spacing: 20) {
            Image(conversation.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(conversation.name)
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                
                Text("Dernier message : 12H30")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
                .rotationEffect(Angle(degrees: 90))
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

struct SearchBannerView: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("\(Image(systemName: "magnifyingglass")) Rechercher une conversation", text: $searchText)
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

struct ConversationView: View {
    let conversation: Conversation
    
    var body: some View {
        VStack {
            Text(conversation.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
        }
        .navigationBarTitle("Détails", displayMode: .inline)
    }
}

// ChildView >>>>>>>>>>>>>>>>>>>>>>>>
struct ChatMessage: Identifiable {
    let id = UUID()
    let content: String
    let isMe: Bool
    let timestamp: Date
}

struct ChatView: View {
    let conversation: Conversation
    @State private var newMessage: String = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(content: "Bonjour !", isMe: true, timestamp: Date()),
        ChatMessage(content: "Hello !", isMe: false, timestamp: Date()),
        ChatMessage(content: "Je souhaite participer au voyage sur Paris en Juillet ?", isMe: true, timestamp: Date()),
        ChatMessage(content: "Bien sûr il nous reste justement une place actuellement", isMe: false, timestamp: Date()),
        ChatMessage(content: "ok, et est-ce que vous acceptez les chiens ?", isMe: true, timestamp: Date())
    ]
    
    var body: some View {
        ZStack {
            Image("Skychat")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .opacity(0.8)
            
            VStack {
                Text(conversation.name)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                
                Divider()
                    .background(.white)
                    .foregroundColor(.white)
                
                VStack {
                    ScrollView {
                        ForEach(messages) { message in
                            ChatBubble(content: message.content, isMe: message.isMe)
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                HStack {
                    TextField("Nouveau message", text: $newMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 100)
                    
                    Button(action: sendMessage) {
                        Text("Envoyer")
                            .fontWeight(.regular)
                            .bold()
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(hue: 0.539, saturation: 0.569, brightness: 0.38, opacity: 0.798))
                            .cornerRadius(10)
                    }
                    .disabled(newMessage.isEmpty)
                }
                .padding(.horizontal, 10)
                
            }
        }
    }
    
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let message = ChatMessage(content: newMessage, isMe: true, timestamp: Date())
        messages.append(message)
        newMessage = ""
    }
}

struct ChatBubble: View {
    let content: String
    let isMe: Bool
    
    var body: some View {
        HStack {
            if isMe {
                Spacer()
                Text(content)
                    .padding()
                    .fontWeight(.regular)
                    .background(Color(hue: 0.594, saturation: 0.0, brightness: 1.0, opacity: 0.298))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                Image("ariana-grande0")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90)
                    .clipShape(Circle())
            } else {
                Image("stephanie")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                    .clipShape(Circle())
                Text(content)
                    .padding()
                    .fontWeight(.regular)
                    .background(Color(hue: 0.671, saturation: 0.095, brightness: 0.368, opacity: 0.509))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                Spacer()
            }
        }
    }
}

struct Chat_Preview: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
