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
