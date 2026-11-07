---
name: swiftui-snapnasser
description: Conventions de code, de design et d'architecture de l'application iPhone SnapNasser (Swift, SwiftUI, Vision, SwiftData). À utiliser dès qu'on crée ou modifie un écran, un modèle de données, la prise de photo, la lecture du texte ou l'historique.
---

# Application iPhone SnapNasser : conventions

## Technologies

- Swift et SwiftUI uniquement. Pas de UIKit sauf si c'est indispensable (par exemple l'appareil photo).
- Vision pour lire le texte des photos.
- SwiftData pour l'historique.
- Aucune bibliothèque externe sans me demander d'abord.

## Design

Toutes les couleurs et polices sont définies **une seule fois**, dans un fichier de thème (`Theme.swift`). Jamais de couleur écrite en dur dans un écran.

- Orange chaud : bouton photo, titres, numéros d'étapes, badge de matière, encadré de réponse finale.
- Fond : crème très clair, presque blanc.
- Texte : brun foncé, jamais noir pur.
- Bords arrondis, beaucoup d'espace, cartes simples.

## Écrans

- **Accueil** : logo, phrase d'accroche, gros bouton rond orange avec icône d'appareil photo. Onglets Accueil et Historique en bas.
- **Photo** : cadrage et validation.
- **Vérification** : texte reconnu, modifiable.
- **Solution** : photo en petit, texte reconnu, **toutes les étapes d'un coup** en cartes numérotées, chaque carte ouvrable pour voir la règle utilisée, réponse finale dans un encadré orange.
- **Historique** : recherche, filtre par matière, favoris, cartes avec vignette, début de l'énoncé, date et badge de matière.

## Données

Un exercice enregistré contient : photo, texte, solution (étapes et réponse finale), date, matière, favori.

## Règles de code

- Un fichier par écran, des vues petites et lisibles.
- Séparer l'interface (vues), les données (modèles) et la logique (services : lecture du texte, appel au serveur).
- Tous les textes visibles par l'élève sont en français, regroupés pour être faciles à modifier.
- Gérer les erreurs avec des messages clairs pour un élève : pas de connexion, limite du jour atteinte, texte illisible.
- Ajouter des aperçus SwiftUI (previews) avec de fausses données pour chaque écran.
- Respecter l'accessibilité : textes agrandissables, contrastes suffisants, étiquettes pour VoiceOver.

## Sécurité

- **Jamais** de clé d'API dans l'application ni dans Git.
- L'application ne parle qu'au serveur intermédiaire (Cloudflare Worker).
- Demander l'autorisation de l'appareil photo et de la galerie avec des messages en français, et ne les utiliser que pour l'exercice de l'élève.

## Tests

- Compiler sans erreur ni avertissement important.
- Tester dans le simulateur, puis sur un vrai iPhone pour la photo.
- Écrire des tests automatiques pour la logique (décodage du JSON, limite journalière, stockage de l'historique).
