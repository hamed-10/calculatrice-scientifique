#ifndef CALC_BASIC_H
#define CALC_BASIC_H

/**
 * Module : basic
 * Opérations de base — arithmétique, fractions, DMS, notation ingénieur
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

double   fraction_eval(int num, int den);
char    *to_dms(double deg);
double   from_dms(int d, int m, double s);
char    *to_engineering(double val);

#endif /* CALC_BASIC_H */
