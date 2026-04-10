#ifndef CALC_CORE_H
#define CALC_CORE_H

/**
 * Module : core
 * Moteur d'évaluation — tokenizer, parser, evaluator, gestion des erreurs
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

double   evaluate(const char *expr);
int      validate_syntax(const char *expr);
void     set_angle_mode(int mode);   /* 0=DEG 1=RAD 2=GRA */

#endif /* CALC_CORE_H */
