# SnapNasser : todo.md

Application iPhone gratuite, en français, pour les élèves de 3ème année secondaire en Tunisie (Sciences expérimentales). Maths, physique-chimie et SVT. Voir le document de cadrage pour le détail des écrans, des couleurs et de la partie technique.

## La boucle /milestone

À chaque fois que je lance `/milestone`, Claude Code suit cette boucle, pour un seul milestone à la fois :

1. **Lire** ce fichier et le document de cadrage. Prendre le premier milestone non terminé.
2. **Planifier** : annoncer en 5 lignes max ce qui va être fait et les fichiers touchés.
3. **Implémenter** les tâches du milestone, dans l'ordre, sans toucher aux milestones suivants.
4. **Vérifier** : compiler, lancer les tests, puis lancer l'appli dans le simulateur iPhone. **Dès qu'un test est réussi, cocher tout de suite la tâche correspondante dans ce fichier**, sans attendre la fin du milestone.
5. **Corriger** : si la compilation, un test ou le simulateur échoue, corriger et revenir à l'étape 4. Au bout de 3 essais sans succès, s'arrêter et expliquer le blocage.
6. **Valider** : cocher les tâches terminées dans ce fichier, mettre à jour `README.md` si le milestone a changé quelque chose (fonctionnalités, structure, commandes, avancement), puis faire un commit Git avec le message `milestone N : titre`.
7. **S'arrêter** et me demander de tester. Ne jamais enchaîner sur le milestone suivant sans mon accord.

### Règles permanentes

- Mettre à jour ce fichier **après chaque test accompli** : cocher `[x]` si le test réussit. S'il échoue, laisser la case vide et ajouter dessous une ligne `Échec : ce qui ne marche pas`, à effacer quand c'est corrigé.
- Ne jamais mettre la clé de l'API dans l'application ni dans Git.
- Couleurs : orange chaud, fond crème, texte brun foncé.
- Tous les textes visibles sont en français.
- Petits commits, code simple, pas de bibliothèque inutile.
- Si une décision n'est pas dans le cadrage, poser une question plutôt que deviner.

### Installer /milestone

`/milestone` est un skill : placer le fichier `SKILL.md` du dossier `milestone` dans `.claude/skills/milestone/SKILL.md`. Claude Code propose alors `/milestone`. Si la commande n'apparaît pas, écrire simplement « fais le prochain milestone de todo.md ».

---

## Milestone 0 : Préparation

- [x] Installer Xcode et vérifier qu'un simulateur iPhone fonctionne.
- [x] Créer le projet Xcode `SnapNasser` en SwiftUI.
- [x] Initialiser Git et ajouter un `.gitignore`.
- [x] Mettre en place les couleurs et la police dans un fichier de thème.
- [x] Créer la structure des dossiers (écrans, modèles, services).

**Validé quand :** l'appli se lance dans le simulateur avec un écran vide aux bonnes couleurs.

## Milestone 1 : Accueil et navigation

- [x] Écran d'accueil : logo, phrase d'accroche, gros bouton rond orange avec icône d'appareil photo.
- [x] Barre d'onglets en bas : Accueil et Historique.
- [x] Écran d'historique vide, avec un message d'accueil.

**Validé quand :** on navigue entre les deux onglets et le design correspond au cadrage.

## Milestone 2 : Prise de photo

- [ ] Demander l'autorisation de l'appareil photo et de la galerie, avec des messages en français.
  À vérifier sur iPhone : les messages sont ajoutés au projet, mais la demande n'apparaît pas dans le simulateur.
- [ ] Prendre une photo avec l'appareil photo.
  À vérifier sur iPhone : le code compile, mais la caméra n'existe pas dans le simulateur.
- [x] Importer une photo depuis la galerie.
- [ ] Écran de cadrage et de validation de la photo.
  Aperçu et boutons « Reprendre » / « Utiliser cette photo » vérifiés. Le recadrage n'est pas encore fait.

**Validé quand :** on peut photographier ou importer un exercice et voir l'image sur l'écran de validation (test sur un vrai iPhone).

## Milestone 3 : Lecture du texte et vérification

- [ ] Lire le texte de l'image avec le framework Vision.
- [ ] Écran de vérification : texte reconnu, modifiable.
- [ ] Gérer le cas où aucun texte n'est trouvé.
- [ ] Garder l'image pour l'envoyer plus tard à l'IA (formules, schémas SVT).

**Validé quand :** un exercice en français est lu correctement et le texte peut être corrigé à la main.

## Milestone 4 : Écran de solution (fausses données)

- [ ] Définir le modèle de solution : matière, étapes (explication, règle utilisée), réponse finale.
- [ ] Écran de solution : photo en petit, texte reconnu, toutes les étapes d'un coup en cartes numérotées en orange.
- [ ] Chaque carte s'ouvre pour montrer la règle ou la loi utilisée.
- [ ] Encadré orange pour la réponse finale.
- [ ] Badge de matière : Maths, Physique-chimie ou SVT.
- [ ] Tester avec 3 fausses solutions, une par matière.

**Validé quand :** l'écran est complet et agréable à lire avec les fausses données.

## Milestone 5 : Historique

- [ ] Stocker les exercices avec SwiftData : photo, texte, solution, date, matière, favori.
- [ ] Liste de cartes, les plus récentes en premier.
- [ ] Barre de recherche.
- [ ] Filtre par matière.
- [ ] Cœur pour mettre en favori.
- [ ] Toucher une carte rouvre l'écran de solution.

**Validé quand :** les exercices sont conservés après avoir fermé et rouvert l'appli.

## Milestone 6 : Serveur intermédiaire (Cloudflare Worker)

- [ ] Créer le Worker et le déployer.
- [ ] Stocker la clé de l'API dans les secrets du Worker.
- [ ] Recevoir un énoncé (texte, et image en option) et appeler l'API Claude.
- [ ] Écrire le prompt système : français, niveau 3ème année secondaire tunisienne, étapes courtes, règle citée, unités vérifiées en physique-chimie, analyse des documents en SVT.
- [ ] Renvoyer un JSON strict : matière, étapes, réponse finale.
- [ ] Limiter à 10 demandes par jour et par téléphone.
- [ ] Gérer les erreurs : JSON invalide, délai dépassé, limite atteinte.

**Validé quand :** un appel de test (curl) renvoie une solution correcte et la 11ème demande du jour est refusée.

## Milestone 7 : Connexion appli et serveur

- [ ] Envoyer le texte et l'image au Worker depuis l'appli.
- [ ] Afficher un état de chargement pendant la résolution.
- [ ] Remplacer les fausses données par la vraie solution.
- [ ] Détecter la matière et afficher le badge.
- [ ] Message clair quand la limite du jour est atteinte, ou quand il n'y a pas de connexion.
- [ ] Enregistrer chaque solution dans l'historique.

**Validé quand :** de la photo à la solution, tout fonctionne sur un vrai iPhone.

## Milestone 8 : Qualité

- [ ] Tester avec au moins 5 exercices réels par matière, tirés des manuels tunisiens.
- [ ] Faire relire des solutions par un enseignant ou un bon élève : les résultats et le vocabulaire correspondent-ils au programme ?
- [ ] Corriger le prompt du Worker selon les erreurs trouvées.
- [ ] Vérifier le texte dynamique (grandes polices), le mode sombre et les petits écrans d'iPhone.
- [ ] Ajouter un message d'avertissement : l'appli peut se tromper, l'élève doit vérifier.

**Validé quand :** les solutions sont fiables sur les exercices testés.

## Milestone 9 : Publication

- [ ] Créer un compte Apple Developer (environ 99 € par an).
- [ ] Icône de l'appli, nom, captures d'écran.
- [ ] Politique de confidentialité, en pensant aux élèves mineurs et aux photos envoyées.
- [ ] Envoyer une version sur TestFlight et la faire tester par quelques élèves.
- [ ] Soumettre à l'App Store.

**Validé quand :** l'appli est installable via TestFlight par des élèves.

---

## Plus tard (version 2)

- [ ] Exercices d'entraînement par matière, chapitre et difficulté, avec correction.
- [ ] Suivi de la progression et conseils de chapitres à revoir.
- [ ] Version Android.
- [ ] Compléter la liste des chapitres avec le programme officiel.
