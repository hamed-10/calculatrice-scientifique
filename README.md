# Calculatrice Scientifique en C

Implémentation en langage C d'une calculatrice scientifique calquée sur la Casio fx-570ES PLUS / fx-991ES PLUS (2e édition, NATURAL-V.P.A.M.).

## Prérequis

- GCC >= 9
- Make
- Linux (Ubuntu 20.04+) ou Windows (MinGW / WSL)

## Compilation

```bash
make
```

## Exécution

```bash
./calc
```

## Tests

```bash
make test
```

## Structure du projet

```
src/         Sources organisés par module
tests/       Tests unitaires par module
stubs/       Implémentations factices du Core (phase 1)
docs/        Documentation technique par module
.github/     Templates PR et issues
```

## Modules

| Module | Dossier | Groupe | Priorité |
|--------|---------|--------|----------|
| Core — moteur d'évaluation | src/core/ | G1 | CRITIQUE |
| Opérations de base | src/basic/ | G2 | HAUTE |
| Interface CLI | src/interface/ | G2 | HAUTE |
| Mémoire et variables | src/memory/ | G3 | HAUTE |
| Constantes scientifiques | src/constants/ | G3 | BASSE |
| Fonctions mathématiques | src/functions/ | G4 | HAUTE |
| Nombres complexes | src/complex/ | G5 | MOYENNE |
| Calcul en base N | src/basen/ | G5 | MOYENNE |
| Statistiques | src/stat/ | G6 | MOYENNE |
| Équations | src/eqn/ | G6 | MOYENNE |
| Calcul intégral/différentiel | src/calculus/ | G7 | MOYENNE |
| Matrices et vecteurs | src/matrix/ | G7 | MOYENNE |

## Règles de contribution

Voir [CONTRIBUTING.md](CONTRIBUTING.md) et les templates dans `.github/`.
