#ifndef CALC_BASEN_H
#define CALC_BASEN_H

/**
 * Module : basen
 * Calcul en base N — mode BASE-N, conversions, opérateurs logiques
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

long     basen_convert(long val, int from_base, int to_base);
long     basen_and(long a, long b);
long     basen_or(long a, long b);
long     basen_xor(long a, long b);

#endif /* CALC_BASEN_H */
