#!/bin/bash

# =============================================================================
#  init_projet.sh — Initialisation structure calculatrice scientifique
#  Usage : bash init_projet.sh
#  À exécuter à la racine du repo cloné (après git clone)
# =============================================================================

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}==> Initialisation de la structure du projet...${NC}"

# -----------------------------------------------------------------------------
# 1. Dossiers sources
# -----------------------------------------------------------------------------
MODULES=(core basic memory functions calculus complex stat basen eqn matrix constants interface)

for mod in "${MODULES[@]}"; do
  mkdir -p "src/$mod"
  echo -e "  ${GREEN}+${NC} src/$mod/"
done

# -----------------------------------------------------------------------------
# 2. Dossiers tests (un par module)
# -----------------------------------------------------------------------------
for mod in "${MODULES[@]}"; do
  mkdir -p "tests/$mod"
  echo -e "  ${GREEN}+${NC} tests/$mod/"
done

# -----------------------------------------------------------------------------
# 3. Dossiers annexes
# -----------------------------------------------------------------------------
mkdir -p stubs docs .github/ISSUE_TEMPLATE .github/workflows
echo -e "  ${GREEN}+${NC} stubs/ docs/ .github/"

# -----------------------------------------------------------------------------
# 4. Fichiers d'en-tête (.h) — un par module, avec garde d'inclusion
# -----------------------------------------------------------------------------
declare -A H_COMMENTS
H_COMMENTS[core]="Moteur d'évaluation — tokenizer, parser, evaluator, gestion des erreurs"
H_COMMENTS[basic]="Opérations de base — arithmétique, fractions, DMS, notation ingénieur"
H_COMMENTS[memory]="Mémoire et variables — Ans, variables A-Y, mémoire M, historique"
H_COMMENTS[functions]="Fonctions mathématiques — trigonométrie, log, puissances, combinatoire"
H_COMMENTS[calculus]="Calcul intégral et différentiel — intégrale numérique, dérivée, somme Σ"
H_COMMENTS[complex]="Nombres complexes — mode CMPLX, opérations, conversions polaires"
H_COMMENTS[stat]="Statistiques — mode STAT, 1-var, 2-var, régressions"
H_COMMENTS[basen]="Calcul en base N — mode BASE-N, conversions, opérateurs logiques"
H_COMMENTS[eqn]="Équations — mode EQN, polynômes deg 2-3, systèmes linéaires"
H_COMMENTS[matrix]="Matrices et vecteurs — modes MATRIX/VECTOR/TABLE"
H_COMMENTS[constants]="Constantes scientifiques et conversions d'unités"
H_COMMENTS[interface]="Interface utilisateur CLI — affichage, historique, modes de calcul"

declare -A H_SIGNATURES
H_SIGNATURES[core]="double   evaluate(const char *expr);
int      validate_syntax(const char *expr);
void     set_angle_mode(int mode);   /* 0=DEG 1=RAD 2=GRA */"
H_SIGNATURES[basic]="double   fraction_eval(int num, int den);
char    *to_dms(double deg);
double   from_dms(int d, int m, double s);
char    *to_engineering(double val);"
H_SIGNATURES[memory]="void     ans_store(double val);
double   ans_recall(void);
void     var_store(char name, double val);
double   var_recall(char name);
void     mem_plus(double val);
double   mem_recall(void);
void     mem_clear(void);"
H_SIGNATURES[functions]="double   fn_sin(double x);
double   fn_cos(double x);
double   fn_tan(double x);
double   fn_log(double base, double x);
double   fn_nrt(int n, double x);
double   fn_permut(int n, int r);
double   fn_combin(int n, int r);"
H_SIGNATURES[calculus]="double   fn_integral(const char *expr, double a, double b);
double   fn_derivative(const char *expr, double x);
double   fn_sum(const char *expr, int start, int end);"
H_SIGNATURES[complex]="typedef struct { double re; double im; } Complex;
Complex  cx_add(Complex a, Complex b);
Complex  cx_mul(Complex a, Complex b);
double   cx_mod(Complex a);
double   cx_arg(Complex a);"
H_SIGNATURES[stat]="void     stat_push(double x);
void     stat_push2(double x, double y);
double   stat_mean(void);
double   stat_stddev(void);
void     stat_clear(void);"
H_SIGNATURES[basen]="long     basen_convert(long val, int from_base, int to_base);
long     basen_and(long a, long b);
long     basen_or(long a, long b);
long     basen_xor(long a, long b);"
H_SIGNATURES[eqn]="int      eqn_quadratic(double a, double b, double c, double *r1, double *r2);
int      eqn_cubic(double a, double b, double c, double d, double *r);
int      eqn_linear2(double coeffs[2][3], double *x, double *y);"
H_SIGNATURES[matrix]="typedef struct { int rows; int cols; double data[4][4]; } Matrix;
Matrix   mat_add(Matrix a, Matrix b);
Matrix   mat_mul(Matrix a, Matrix b);
double   mat_det(Matrix m);"
H_SIGNATURES[constants]="double   get_constant(const char *name);
double   convert_unit(double val, const char *from, const char *to);"
H_SIGNATURES[interface]="void     cli_start(void);
void     cli_display_result(double val);
void     cli_display_error(const char *msg);
void     cli_set_format(int fmt, int digits);  /* fmt: 0=Norm 1=Fix 2=Sci */"

for mod in "${MODULES[@]}"; do
  GUARD="CALC_$(echo "$mod" | tr '[:lower:]' '[:upper:]')_H"
  cat > "src/$mod/$mod.h" << EOF
#ifndef ${GUARD}
#define ${GUARD}

/**
 * Module : $mod
 * ${H_COMMENTS[$mod]}
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

${H_SIGNATURES[$mod]}

#endif /* ${GUARD} */
EOF
  echo -e "  ${GREEN}+${NC} src/$mod/$mod.h"
done

# -----------------------------------------------------------------------------
# 5. Fichiers .c squelettes (un par module — à compléter par les groupes)
# -----------------------------------------------------------------------------
for mod in "${MODULES[@]}"; do
  cat > "src/$mod/$mod.c" << EOF
#include "$mod.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * Module : $mod
 * TODO : implémenter les fonctions déclarées dans $mod.h
 */
EOF
  echo -e "  ${GREEN}+${NC} src/$mod/$mod.c"
done

# -----------------------------------------------------------------------------
# 6. Fichiers de tests squelettes
# -----------------------------------------------------------------------------
for mod in "${MODULES[@]}"; do
  cat > "tests/$mod/test_$mod.c" << EOF
#include "../../src/$mod/$mod.h"
#include <assert.h>
#include <stdio.h>

/*
 * Tests unitaires — module $mod
 * Responsable tests : (à compléter)
 *
 * Convention :
 *   - Une fonction test_xxx() par fonction testée
 *   - Utiliser assert() pour les vérifications
 *   - Afficher un message de succès en fin de chaque test
 */

int main(void) {
    printf("Tests module $mod — debut\\n");

    /* TODO : ajouter les tests ici */

    printf("Tests module $mod — OK\\n");
    return 0;
}
EOF
  echo -e "  ${GREEN}+${NC} tests/$mod/test_$mod.c"
done

# -----------------------------------------------------------------------------
# 7. Stub du Core (livré par G1 à J+3)
# -----------------------------------------------------------------------------
cat > stubs/core_stub.c << 'EOF'
/**
 * core_stub.c — Implémentation factice du module Core
 *
 * Ce fichier est fourni par le Groupe 1 pour permettre aux autres groupes
 * de développer leurs modules avant que le Core soit finalisé.
 *
 * IMPORTANT : Ce stub retourne des valeurs constantes ou nulles.
 *             Il sera remplacé par src/core/core.c à la milestone "Core stable".
 *
 * Ne pas modifier ce fichier. Signaler tout problème via une GitHub Issue.
 */

#include "../src/core/core.h"
#include <stdio.h>

static int angle_mode = 0; /* 0=DEG par défaut */

double evaluate(const char *expr) {
    (void)expr;
    return 0.0; /* stub — retourne 0 */
}

int validate_syntax(const char *expr) {
    (void)expr;
    return 1; /* stub — toujours valide */
}

void set_angle_mode(int mode) {
    angle_mode = mode;
}
EOF
echo -e "  ${GREEN}+${NC} stubs/core_stub.c"

# -----------------------------------------------------------------------------
# 8. Makefile
# -----------------------------------------------------------------------------
cat > Makefile << 'EOF'
# =============================================================================
#  Makefile — Calculatrice Scientifique en C
#  Usage : make        → compile le projet complet
#          make test   → compile et exécute les tests
#          make clean  → supprime les fichiers générés
# =============================================================================

CC      = gcc
CFLAGS  = -Wall -Wextra -std=c99 -Wno-unused-parameter

MODULES = core basic memory functions calculus complex stat basen eqn matrix constants interface

SRC     = $(foreach m,$(MODULES),$(wildcard src/$(m)/*.c))
OBJS    = $(SRC:.c=.o)
TARGET  = calc

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -lm
	@echo "==> Build OK : ./$(TARGET)"

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test:
	@echo "==> Compilation des tests..."
	@for mod in $(MODULES); do \
	    echo "  test $$mod..."; \
	    $(CC) $(CFLAGS) tests/$$mod/test_$$mod.c $(SRC) -o tests/$$mod/runner_$$mod -lm 2>&1 && \
	    ./tests/$$mod/runner_$$mod || exit 1; \
	done
	@echo "==> Tous les tests passent."

clean:
	rm -f $(OBJS) $(TARGET)
	find tests -name "runner_*" -delete
	@echo "==> Clean OK"

.PHONY: all test clean
EOF
echo -e "  ${GREEN}+${NC} Makefile"

# -----------------------------------------------------------------------------
# 9. .gitignore
# -----------------------------------------------------------------------------
cat > .gitignore << 'EOF'
# Compilés
*.o
*.out
a.out
calc

# Tests
tests/**/runner_*

# Environnements Windows
*.exe
*.dll

# Éditeurs
.vscode/
.idea/
*.swp
*~
.DS_Store
EOF
echo -e "  ${GREEN}+${NC} .gitignore"

# -----------------------------------------------------------------------------
# 10. README.md
# -----------------------------------------------------------------------------
cat > README.md << 'EOF'
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
EOF
echo -e "  ${GREEN}+${NC} README.md"

# -----------------------------------------------------------------------------
# 11. GitHub Actions — workflow de build automatique
# -----------------------------------------------------------------------------
cat > .github/workflows/build.yml << 'EOF'
name: Build check

on:
  pull_request:
    branches: [main, dev]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install GCC
        run: sudo apt-get install -y gcc make

      - name: Compile
        run: make

      - name: Run tests
        run: make test
EOF
echo -e "  ${GREEN}+${NC} .github/workflows/build.yml"

# -----------------------------------------------------------------------------
# 12. docs/ — un README par module
# -----------------------------------------------------------------------------
for mod in "${MODULES[@]}"; do
  mkdir -p "docs/$mod"
  cat > "docs/$mod/README.md" << EOF
# Module $mod

**Groupe responsable :** (à compléter)
**Dossier :** \`src/$mod/\`
**Priorité :** (à compléter)

## Description

${H_COMMENTS[$mod]}

## Fonctions exposées

Voir \`src/$mod/$mod.h\`

## Dépendances

- Module Core (\`src/core/core.h\`) — obligatoire

## Notes d'implémentation

(à remplir par le groupe)
EOF
  echo -e "  ${GREEN}+${NC} docs/$mod/README.md"
done

# -----------------------------------------------------------------------------
# Résumé final
# -----------------------------------------------------------------------------
echo ""
echo -e "${BLUE}==> Structure créée avec succès.${NC}"
echo ""
echo -e "${YELLOW}Prochaines commandes à exécuter :${NC}"
echo ""
echo "  git checkout dev"
echo "  git add ."
echo "  git commit -m \"[INIT] structure complète du projet\""
echo "  git push origin dev"
echo ""
echo -e "${YELLOW}Ensuite, créer les branches de modules depuis dev :${NC}"
echo ""
FEAT_BRANCHES=(core basic interface memory constants functions complex basen stat eqn calculus matrix)
for b in "${FEAT_BRANCHES[@]}"; do
  echo "  git checkout -b feature/$b dev && git push origin feature/$b && git checkout dev"
done
echo ""
echo -e "${GREEN}Repo prêt pour la réunion de lancement.${NC}"
