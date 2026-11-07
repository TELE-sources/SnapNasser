---
name: worker-snapnasser
description: Conception du serveur intermédiaire de SnapNasser, un Cloudflare Worker qui appelle l'API Claude, protège la clé, renvoie la solution en JSON et limite les demandes par jour. À utiliser dès qu'on crée, modifie, teste ou déploie le dossier worker/ ou la communication entre l'application et le serveur.
---

# Serveur intermédiaire : Cloudflare Worker

## Rôle

L'application envoie l'énoncé (et l'image) au Worker. Le Worker appelle l'API Claude avec la clé secrète, puis renvoie une solution structurée. L'application ne parle **qu'à ce Worker**.

## Sécurité

- La clé de l'API est dans les **secrets** du Worker (`wrangler secret put`), jamais dans le code, jamais dans Git.
- Le nom du modèle est une variable de configuration, pour pouvoir le changer sans modifier le code.
- Limiter la taille des images et du texte reçus.
- Ne rien enregistrer d'inutile : pas de conservation des photos des élèves sur le serveur.

## Entrée attendue

```json
{
  "texte": "énoncé lu par Vision",
  "image": "photo en base64, facultative",
  "appareil": "identifiant anonyme de l'installation"
}
```

## Sortie : JSON strict

```json
{
  "matiere": "maths | physique-chimie | svt",
  "etapes": [
    {
      "titre": "Titre court",
      "explication": "Explication courte et claire",
      "regle": "Règle, loi ou propriété utilisée"
    }
  ],
  "reponse_finale": "Phrase de conclusion, avec l'unité si besoin"
}
```

- Valider le JSON reçu de l'IA avant de le renvoyer. S'il est invalide, réessayer une fois, puis renvoyer une erreur claire.
- Aucune autre donnée en dehors de ce format.

## Prompt système

Le prompt envoyé à l'IA suit les règles du skill `programme-tunisien` : français, niveau 3ème année secondaire tunisienne, étapes courtes, règle citée, unités vérifiées en physique-chimie, analyse des documents en SVT. Il demande de répondre uniquement avec le JSON ci-dessus.

## Limite journalière

- 10 demandes par jour et par appareil, comptées par l'identifiant anonyme envoyé par l'application, avec Cloudflare KV (ou Durable Objects).
- Au-delà : renvoyer une erreur dédiée (`limite_atteinte`) que l'application transforme en message clair pour l'élève.
- Le compteur repart à zéro chaque jour.

## Erreurs à gérer

| Cas | Réponse |
| --- | --- |
| Limite du jour atteinte | `limite_atteinte` |
| Texte vide ou illisible | `enonce_invalide` |
| JSON invalide après un essai de plus | `resolution_echouee` |
| API Claude indisponible ou trop lente | `service_indisponible` |

## Tests

- Test local avec `wrangler dev`, puis avec `curl` : une solution correcte pour chaque matière.
- Vérifier que la 11ème demande du jour est refusée.
- Vérifier qu'aucune clé n'apparaît dans les réponses, les journaux ou le dépôt.
- Mettre à jour `README.md` avec les commandes pour déployer.
