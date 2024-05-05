# Introduction
Cette application est la version mobile d'une application React sur laquelle je suis en train de travailler. Elle utilise une base de données Firestore de test qui ne craint donc rien.

# Dépendences
Flutter: 3.19.0
firebase_core: ^2.30.1
firebase_auth: ^4.19.3
firebase_database: ^10.5.3
cloud_firestore: ^4.17.1
flutter_form_builder: ^9.2.1
Pour lancer
Une fois l'application clonée, un flutter pub get puis flutter run doivent suffire.

# But
Le but de cette application est de gérer les unités militaires d'un jeu.

# Pages
## Connexion/inscription
Vous pouvez créer un compte avec une adresse e-mail et un mot de passe. L'adresse e-mail n'est pas vérifiée et peut donc être bidon. Le mot de passe doit faire au moins 6 caractères.
Le compte email: test@gmail.com mdp: 000000 existe déjà avec quelques données. 

## Gestion des parties
Cette page vous permet de sélectionner une partie existante ou bien de créer une partie en sélectionnant les joueurs à intégrer.

## Page d'unités
Vous pouvez trouver la liste des unités regroupées par groupe. Vous pouvez swiper pour passer d'un groupe à l'autre.

### IMPORTANT : Je n'ai pas eu le temps de finaliser les unités et elles ne s'actualisent pas en temps réel. Il faut donc revenir en arrière et re-sélectionner le groupe pour voir les changements. En revanche, les groupes s'actualisent. L'indicateur de l'index de groupe en bas à gauche ne fonctionne pas non plus.
