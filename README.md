# CoTrip - Trouvez vos compagnons de voyage 🌍✈️

<p align="center">
  <img src="./assets/logo.png" width="200" alt="CoTrip Logo"/>
</p>

CoTrip est une application iOS moderne développée en SwiftUI qui permet aux voyageurs de se connecter et de partager leurs expériences de voyage. Que ce soit pour partager un trajet, diviser les coûts d'hébergement ou trouver des partenaires pour des activités de groupe, CoTrip facilite la mise en relation des voyageurs partageant les mêmes centres d'intérêt.

## ✨ Fonctionnalités principales

- 🔍 **Recherche avancée** : Trouvez des compagnons de voyage selon vos critères (destination, dates, budget, etc.)
- 🚗 **Partage de transport** : Partagez vos trajets en voiture, train ou avion
- 🏠 **Colocation temporaire** : Divisez les coûts d'hébergement
- 🎯 **Activités de groupe** : Organisez ou rejoignez des activités touristiques
- 💬 **Messagerie intégrée** : Communiquez en toute sécurité avec d'autres voyageurs
- ⭐ **Système de notation** : Évaluez et consultez les avis sur les utilisateurs

## 📱 Captures d'écran

<p align="center">
  <img src="./assets/screenshots/home.png" width="200" alt="Page d'accueil"/>
  <img src="./assets/screenshots/search.png" width="200" alt="Recherche"/>
  <img src="./assets/screenshots/chat.png" width="200" alt="Messagerie"/>
  <img src="./assets/screenshots/profile.png" width="200" alt="Profil"/>
</p>

## 🛠 Technologies utilisées

- SwiftUI
- Core Data
- MapKit
- CloudKit
- Firebase (Authentication & Messaging)
- Combine Framework

## 📋 Prérequis

- iOS 15.0 ou supérieur
- Xcode 13.0 ou supérieur
- Compte développeur Apple (pour le déploiement)

## ⚙️ Installation

1. Clonez le repository
```bash
git clone https://github.com/votre-username/CoTrip.git
```

2. Installez les dépendances via Swift Package Manager
```bash
cd CoTrip
xed .  # Ouvre le projet dans Xcode
```

3. Configurez les fichiers de configuration Firebase
- Téléchargez `GoogleService-Info.plist` depuis votre console Firebase
- Ajoutez-le au projet Xcode

4. Compilez et exécutez l'application

## 📁 Structure du projet

```
CoTrip/
├── App/
│   └── CoTripApp.swift
├── Views/
│   ├── Home/
│   ├── Search/
│   ├── Chat/
│   └── Profile/
├── Models/
├── ViewModels/
├── Services/
├── Utils/
└── Resources/
```

## 🔐 Sécurité

- Vérification d'identité des utilisateurs
- Chiffrement des messages
- Système de signalement
- Modération des contenus
- Protection des données personnelles (RGPD)

## 🗺 Roadmap

- [ ] Intégration de la réservation directe
- [ ] Support des paiements in-app
- [ ] Version iPad
- [ ] Mode hors ligne
- [ ] Support multilangue

## 👥 Contribution

Les contributions sont les bienvenues ! Consultez notre [guide de contribution](CONTRIBUTING.md) pour plus d'informations.

## 📄 Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE.md](LICENSE.md) pour plus de détails.

## 📱 Disponibilité

<p align="center">
  <a href="https://apps.apple.com/votre-app">
    <img src="./assets/download-appstore.png" width="200" alt="Télécharger sur l'App Store"/>
  </a>
</p>

## 📞 Support

- Email : support@cotrip.com
- Site web : [www.cotrip.com](http://www.cotrip.com)
- Twitter : [@CoTrip](https://twitter.com/cotrip)

---

<p align="center">
  Développé avec ❤️ en France 🇫🇷
</p>