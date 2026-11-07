---
name: publication-snapnasser
description: Préparation de la publication de SnapNasser sur TestFlight puis sur l'App Store : compte Apple Developer, icône, captures d'écran, confidentialité pour les élèves mineurs, vérifications avant envoi. À utiliser pour le dernier milestone ou dès qu'on parle de publier, de TestFlight ou de l'App Store.
---

# Publier SnapNasser

## Avant de commencer

Les règles et les formulaires d'Apple changent régulièrement. Avant chaque étape, vérifier la documentation officielle d'Apple (App Store Connect et App Store Review Guidelines) plutôt que se fier à la mémoire, et expliquer les étapes à l'utilisateur simplement : il n'est pas développeur.

## Étapes

1. **Compte Apple Developer** : abonnement annuel payant. C'est l'utilisateur qui le crée, avec son identité. Ne jamais saisir ses informations à sa place.
2. **Identité de l'application** : nom SnapNasser, identifiant du paquet (bundle ID), version et numéro de build.
3. **Icône** : une icône simple, orange sur fond crème, lisible en petit.
4. **Captures d'écran** : accueil, vérification du texte, solution, historique. Textes en français.
5. **Description** : courte, claire, en français. Dire que l'application aide aux révisions de la 3ème année secondaire (Sciences expérimentales) et qu'elle peut se tromper.
6. **TestFlight** : envoyer une première version à quelques élèves et à un enseignant, recueillir leurs retours, corriger.
7. **App Store** : soumettre quand les tests sont bons.

## Confidentialité et élèves mineurs

Les utilisateurs sont des adolescents. Il faut :

- Une **politique de confidentialité** claire, publiée sur une page web accessible, en français.
- Dire exactement ce qui est envoyé : le texte et la photo de l'exercice, vers le serveur puis vers l'IA.
- Ne conserver aucune photo sur le serveur, ne rien vendre, ne pas suivre les élèves.
- Ne demander ni nom, ni e-mail, ni contact : l'application n'a pas de compte.
- Remplir honnêtement le questionnaire de confidentialité d'App Store Connect, et la classification d'âge.
- Expliquer pourquoi l'appareil photo et la galerie sont utilisés, dans des messages en français.

## Avant chaque envoi

- [ ] Tous les tests de `tests-snapnasser` réussis, sur un vrai iPhone.
- [ ] Aucune clé d'API dans l'application, le code ou Git.
- [ ] Le serveur de production est déployé et la limite de 10 demandes par jour fonctionne.
- [ ] L'avertissement « l'application peut se tromper » est visible.
- [ ] README et todo.md à jour.

## Après la publication

- Suivre les retours et les plantages dans App Store Connect.
- Surveiller le coût de l'API : le nombre de demandes par jour et le total.
- Garder la liste des améliorations pour la version 2.
