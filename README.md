# SnapNasser

Application iPhone gratuite, en français, pour les élèves de **3ème année secondaire en Tunisie, section Sciences expérimentales**.

L'élève prend en photo un exercice de **maths**, de **physique-chimie** ou de **SVT** (Sciences de la Vie et de la Terre). L'application lit l'énoncé, puis affiche la solution complète, avec toutes les étapes d'un coup, la règle ou la loi utilisée à chaque étape, et la réponse finale dans un encadré orange.

## Fonctionnalités (version 1)

- Prise de photo d'un exercice, ou import depuis la galerie.
- Lecture automatique de l'énoncé, modifiable avant la résolution.
- Solution expliquée étape par étape, en français, selon le programme tunisien.
- Détection de la matière, avec un badge orange.
- Analyse des documents, schémas et graphiques pour la SVT.
- Historique avec recherche, filtre par matière et favoris.
- Limite de 10 exercices par jour et par téléphone.

## Technique

| Élément | Choix |
| --- | --- |
| Plateforme | iPhone (Android plus tard) |
| Langage et interface | Swift et SwiftUI |
| Lecture du texte | Framework Vision d'Apple |
| Historique | SwiftData |
| Résolution | API Claude, via un serveur intermédiaire |
| Serveur intermédiaire | Cloudflare Worker |

La clé de l'API est stockée dans les secrets du Worker. Elle n'est **jamais** dans l'application ni dans Git. L'application ne parle qu'au Worker.

## Design

- Orange chaud pour le bouton photo, les titres, les numéros d'étapes et la réponse finale.
- Fond crème très clair.
- Texte brun foncé.

## Structure du projet

```
SnapNasser/
├── README.md
├── todo.md                    # étapes et milestones
├── .claude/
│   └── skills/
│       ├── milestone/SKILL.md             # commande /milestone
│       ├── programme-tunisien/SKILL.md    # niveau et vocabulaire des solutions
│       ├── swiftui-snapnasser/SKILL.md    # conventions de l'application iPhone
│       ├── worker-snapnasser/SKILL.md     # serveur intermédiaire
│       ├── tests-snapnasser/SKILL.md      # méthode de test
│       └── publication-snapnasser/SKILL.md # TestFlight et App Store
├── SnapNasser.xcodeproj/      # projet Xcode
├── SnapNasser/                # application iPhone (code Swift)
│   ├── Theme/Theme.swift      # couleurs et polices
│   ├── Ecrans/                # AccueilView, HistoriqueView, ValidationPhotoView
│   ├── Modeles/               # modèles de données (vide pour l'instant)
│   └── Services/              # CameraPicker (appareil photo)
└── worker/                    # serveur intermédiaire (Cloudflare Worker)
```

## Démarrer

**Prérequis :** un Mac, Xcode, Git, Claude Code, et un compte Cloudflare (gratuit).

1. Ouvrir le projet dans Xcode et lancer l'application dans le simulateur iPhone.
2. Pour le serveur : se placer dans le dossier `worker/`, puis ajouter la clé de l'API dans les secrets Cloudflare avec `npx wrangler secret put ANTHROPIC_API_KEY`, et déployer avec `npx wrangler deploy`.
3. Indiquer l'adresse du Worker dans la configuration de l'application.

## Travailler avec Claude Code

Le développement avance par milestones, un seul à la fois :

1. Ouvrir Claude Code dans le dossier du projet.
2. Taper `/milestone` pour lancer le prochain milestone, ou `/milestone 3` pour choisir le numéro.
3. Tester l'application dans le simulateur, puis valider avant de passer au suivant.

Claude Code met à jour `todo.md` après chaque test accompli, et ce README à la fin de chaque milestone.

## Avancement

Voir [todo.md](todo.md) pour la liste complète des milestones, de la préparation à la publication sur TestFlight.

## Avertissement

SnapNasser est un outil d'aide aux révisions. L'intelligence artificielle peut se tromper : l'élève doit toujours vérifier les résultats et se référer à son cours et à son enseignant.
