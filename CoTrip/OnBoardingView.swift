import SwiftUI

//https://dev.to/domanovdev/swiftui-onboarding-view-1165

struct OnBoarding: View {
    @State private var isAnimating: Bool = false
    @State private var currentPage: Int = 1
    @Binding var firstTime: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Spacer()
                Text("Découvrez Cotrip")
                    .font(.system(size: 40))
                    .padding(.bottom,15)
                    .bold()

                if currentPage == 1 {
                    OnboardingViewOne()
                } else if currentPage == 2 {
                    OnboardingViewTwo()
                } else if currentPage == 3 {
                    OnboardingViewThree()
                }
                
                Spacer()
                
                Button(action: {
                    if currentPage < 3 {
                        currentPage += 1
                    } else {
                        firstTime = false
                    }
                }, label: {
                    Text(currentPage < 3 ? "Suivant" : "C'est parti !")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(
                                    Color.orange)
                        )
                })
                .shadow(radius: 10)
                
                Spacer()
            }
            .onAppear(perform: {
                isAnimating = false
                withAnimation(.easeOut(duration: 0.5)) {
                    self.isAnimating = true
                }
            })
        }
    }
}

struct OnboardingViewOne: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Image("eiffel")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,20)
                .padding(.bottom,15)
            Spacer()
            
            Text("Partez à l'aventure l'esprit léger")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
            
            Text("Avec CoTrip vous voyagez à plusieurs selon vos propres envies et besoins")
            
                .multilineTextAlignment(.center)
                .frame(maxWidth: 250)
                .foregroundColor(.black)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
            
            Spacer()
        }
    }
}

struct OnboardingViewTwo: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image("valises")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,20)
                .padding(.bottom,15)
            Spacer()
            Text("Partez tout en sécurité")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
            
            Text("Nos adhérents ont des profils vérifiés.")
            
                .multilineTextAlignment(.center)
                .frame(maxWidth: 250)
                .foregroundColor(.black)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
            
            Spacer()
        }
    }
}

struct OnboardingViewThree: View {
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image("travelworld")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,20)
                .padding(.bottom,15)
            Spacer()
            Text("Préservez votre budget")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
            
            Text("Un partage des dépenses automatique et sécurisé grâce à notre partenaire HelloBank !")
            
                .multilineTextAlignment(.center)
                .frame(maxWidth: 250)
                .foregroundColor(.black)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
            
            Spacer()
        }
    }
}

//struct OnBoarding_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoarding()
//    }
//}

