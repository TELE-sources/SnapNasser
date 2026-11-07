---
name: milestone
description: Réaliser le prochain milestone de todo.md (ou celui indiqué) pour SnapNasser, en boucle : planifier, implémenter, tester, cocher todo.md, mettre à jour README.md, committer, puis s'arrêter pour validation. À utiliser quand on tape /milestone ou qu'on demande de faire le prochain milestone.
argument-hint: [numéro du milestone, facultatif]
---

Tu travailles sur SnapNasser, une application iPhone en SwiftUI pour les élèves de 3ème année secondaire en Tunisie. Suis la boucle ci-dessous pour UN seul milestone.

Milestone demandé : $ARGUMENTS
(Si rien n'est indiqué, prends le premier milestone de todo.md qui n'est pas entièrement coché.)

## Boucle

1. **Lire** `todo.md` et le document de cadrage du projet. Identifier le milestone à faire et vérifier que les précédents sont bien terminés. Sinon, me le dire et t'arrêter.
2. **Planifier** : annonce en 5 lignes maximum ce que tu vas faire et les fichiers que tu vas créer ou modifier. Si une décision n'est pas dans le cadrage, pose-moi une question avant de continuer.
3. **Implémenter** les tâches du milestone, dans l'ordre. Ne commence aucune tâche d'un autre milestone.
4. **Vérifier** : compile le projet, lance les tests, puis lance l'appli dans le simulateur iPhone et contrôle le critère « Validé quand » du milestone. **Dès qu'un test est réussi, coche immédiatement la tâche correspondante dans `todo.md`**, sans attendre la fin du milestone. Si un test échoue, laisse la case vide et ajoute dessous une ligne `Échec : ce qui ne marche pas`, à effacer quand c'est corrigé.
5. **Corriger** : si la compilation, un test ou la vérification échoue, corrige puis recommence l'étape 4. Après 3 essais sans succès, arrête-toi et explique le blocage simplement.
6. **Valider** : vérifie que `todo.md` est à jour (toutes les tâches terminées sont cochées), mets à jour `README.md` si le milestone a changé quelque chose (fonctionnalités, structure des dossiers, commandes pour démarrer, avancement), puis fais un commit Git avec le message `milestone N : titre`.
7. **S'arrêter** : résume en 5 lignes maximum ce qui a été fait, dis-moi précisément quoi tester sur le simulateur ou sur mon iPhone, et attends mon accord. N'enchaîne jamais sur le milestone suivant.

## Règles permanentes

- Ne mets jamais la clé de l'API dans l'application, ni dans Git.
- Couleurs : orange chaud, fond crème, texte brun foncé.
- Tous les textes visibles par l'élève sont en français.
- Petits commits, code simple et lisible, pas de bibliothèque inutile.
- Ne modifie pas ce qui fonctionne déjà, sauf si le milestone l'exige.
- Parle-moi simplement : je ne suis pas développeur.
