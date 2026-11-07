---
name: tests-snapnasser
description: Méthode de test de SnapNasser à chaque milestone : compilation, tests automatiques, simulateur, vrai iPhone, exercices réels par matière, et mise à jour de todo.md. À utiliser avant de cocher une tâche, de valider un milestone ou de corriger un bug.
---

# Tester SnapNasser

## Principe

Aucune tâche n'est terminée tant qu'elle n'a pas été testée. Un test réussi se coche **tout de suite** dans `todo.md`. Un test échoué laisse la case vide, avec une ligne `Échec : ce qui ne marche pas` juste en dessous, effacée quand c'est corrigé.

## Les quatre niveaux de test

1. **Compilation** : le projet compile sans erreur et sans avertissement important.
2. **Tests automatiques** : lancer tous les tests du projet. Écrire des tests pour la logique : décodage du JSON, limite journalière, stockage de l'historique, filtre par matière.
3. **Simulateur iPhone** : lancer l'appli, parcourir l'écran du milestone, vérifier le critère « Validé quand ».
4. **Vrai iPhone** : indispensable pour la photo et la lecture du texte. Dire précisément à l'utilisateur quoi tester.

## Exercices de test

Constituer un dossier `tests/exercices/` avec, pour chaque matière, au moins 5 exercices réels tirés des manuels tunisiens :

- **Maths** : un énoncé court, un énoncé avec formule (fraction, racine, puissance), un énoncé en plusieurs questions.
- **Physique-chimie** : un calcul avec unités, un exercice avec un schéma ou un tableau.
- **SVT** : un exercice avec document, graphique ou schéma.

Tester aussi les cas difficiles : photo floue, photo de travers, mauvaise lumière, texte manuscrit, énoncé incomplet.

## Qualité des solutions

À chaque changement du prompt du serveur :

- Relancer les exercices de test de chaque matière.
- Vérifier que le résultat est juste, que les unités sont correctes et que le vocabulaire correspond au skill `programme-tunisien`.
- Faire relire des solutions par un enseignant ou un bon élève avant de publier.

## Cas à toujours vérifier

- Pas de connexion internet.
- Limite journalière atteinte (la 11ème demande est refusée avec un message clair).
- Énoncé vide ou illisible.
- Réponse invalide de l'IA.
- Aucune clé d'API dans le code, dans les journaux ou dans Git.

## Rapport de fin de milestone

Après les tests, résumer en 5 lignes maximum : ce qui a été testé, ce qui marche, ce qui reste à corriger, et ce que l'utilisateur doit tester lui-même.
