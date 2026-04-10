#ifndef CALC_CONSTANTS_H
#define CALC_CONSTANTS_H

/**
 * Module : constants
 * Constantes scientifiques et conversions d'unités
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

double   get_constant(const char *name);
double   convert_unit(double val, const char *from, const char *to);

#endif /* CALC_CONSTANTS_H */
