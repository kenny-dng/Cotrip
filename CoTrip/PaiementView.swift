import SwiftUI

struct Paiement: View {
    @State private var paiementCB = 1
    @State private var paiementAP = 1
    
    var body: some View {
        ZStack {
            Image("Sky")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                if paiementCB == 1 {
                    ChoixPaiement(destination: nextPage)
                } else if paiementCB == 2 {
                    InfoCB(destination: nextPage)
                } else if paiementCB == 3 {
                    PaiementValid(destination: resetPages)
                }
            }
        }
    }
    func nextPage() {
        paiementCB += 1
    }
    
    func resetPages() {
        paiementCB = 1
    }
}
struct ChoixPaiement: View {
    var destination: () -> Void
    
    var body: some View {
        Text("Choisissez un moyen de paiement")
            .font(.title)
            .bold()
            .padding(.bottom,20)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        VStack (spacing: 15){
            Button {
                destination()
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(20)
                        .frame(width: 150, height: 80)
                        .shadow(color: .gray, radius: 3, x: 0, y: 1)
                    Image("cbv")
                        .resizable()
                        .frame(width: 100, height: 50)
                        .padding()
                }
            }
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(20)
                        .frame(width: 150, height: 80)
                        .shadow(color: .gray, radius: 3, x: 0, y: 1)
                    Image("applepay1")
                        .resizable()
                        .frame(width: 120, height: 45)
                        .padding()
                }
            }
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(20)
                        .frame(width: 150, height: 80)
                        .shadow(color: .gray, radius: 3, x: 0, y: 1)
                    Image("PayPal")
                        .resizable()
                        .frame(width: 130, height: 40)
                        .padding()
                }
            }
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(20)
                        .frame(width: 150, height: 80)
                        .shadow(color: .gray, radius: 3, x: 0, y: 1)
                    Image("googlepay1")
                        .resizable()
                        .frame(width: 100, height: 50)
                        .padding()
                }
            }
        }
    }
}

struct InfoCB: View {
    var destination: () -> Void
    @State private var nomCarte = ""
    @State private var numeroCarte = ""
    @State private var dateDExpiration = ""
    @State private var codeSécuritéCCV: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                
                TextField("Nom sur la Carte", text: $nomCarte)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                TextField("Numero de carte à 16 chiffres", text: $numeroCarte)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                TextField("Date d'expiration", text: $dateDExpiration)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                SecureField("Numero CCV à 3 chiffres", text: $codeSécuritéCCV)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                EmptyView()
            }
        }
        ZStack {
            Spacer()
            Button {
                destination()
            } label: {
                Text("Payer")
                    .padding(10)
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(30)
            }
            .padding()
        }
    }
}
struct PaiementValid: View {
    var destination: () -> Void
    
    var body: some View {
        VStack {
            Text("Payement réussi")
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.white)
            
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            Text("")
            Button {
                destination()
            } label: {
                Text("Retour à l'accueil")
                    .padding(10)
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(30)
            }
            .padding()
        }
    }
}

struct Paiement_Previews: PreviewProvider {
    static var previews: some View {
        Paiement()
    }
}
