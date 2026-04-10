## Description

**Module concerné :** <!-- ex: CORE / BASIC / MEMORY / ... -->
**Branche source :** `feature/[module]`
**Milestone cible :** <!-- Phase 1 / Phase 2 / Phase 3 -->

Décrivez brièvement ce qui a été implémenté dans cette PR :

-

---

## Fonctions implémentées

<!-- Listez chaque fonction livrée dans cette PR -->

| Fonction | Fichier | Statut |
|----------|---------|--------|
| `nom_fonction()` | `src/[module]/fichier.c` | ✅ Complet / ⚠️ Partiel |

---

## Tests associés

<!-- Indiquez les fichiers de tests créés ou modifiés -->

| Fichier de test | Cas couverts |
|-----------------|-------------|
| `tests/[module]/test_xxx.c` | Description des cas testés |

---

## Checklist obligatoire

Le reviewer ne doit pas approuver si une case est non cochée sans justification.

### Code
- [ ] Le code compile sans warning avec `gcc -Wall -Wextra -std=c99`
- [ ] Aucune dépendance externe (hors bibliothèque standard C)
- [ ] Les noms de fonctions respectent les signatures définies dans le fichier `.h`
- [ ] Aucun fichier `.h` d'un autre module n'a été modifié sans accord

### Tests
- [ ] Un fichier de test existe dans `tests/[module]/`
- [ ] Tous les tests passent (`make test`)
- [ ] Les cas limites sont couverts (valeurs nulles, débordements, arguments invalides)
- [ ] Le responsable tests du groupe a validé les tests

### Documentation
- [ ] Les fonctions publiques sont documentées (commentaire au-dessus de chaque signature dans le `.h`)
- [ ] Le fichier `README.md` du module est mis à jour si nécessaire

### Git
- [ ] Les commits respectent le format `[MODULE] description courte`
- [ ] Pas de fichiers générés ou binaires inclus (`.o`, `a.out`, exécutables)
- [ ] La branche est à jour avec `dev` (rebase ou merge effectué)

---

## Dépendances

<!-- Cette PR dépend-elle d'une autre PR ou d'un module non encore mergé ? -->

- [ ] Cette PR ne dépend d'aucune autre PR ouverte
- [ ] Cette PR dépend de : <!-- #numéro_PR ou branche -->

---

## Notes pour le reviewer

<!-- Informations supplémentaires, points d'attention, décisions techniques à valider -->

---

## Pour le chef de projet uniquement (merge vers `main`)

- [ ] Validé par le responsable module
- [ ] Validé par le responsable tests
- [ ] Aucune régression détectée sur les modules déjà mergés
- [ ] `make` compile l'ensemble du projet sans erreur
