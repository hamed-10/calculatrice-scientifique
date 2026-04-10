#ifndef CALC_EQN_H
#define CALC_EQN_H

/**
 * Module : eqn
 * Équations — mode EQN, polynômes deg 2-3, systèmes linéaires
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

int      eqn_quadratic(double a, double b, double c, double *r1, double *r2);
int      eqn_cubic(double a, double b, double c, double d, double *r);
int      eqn_linear2(double coeffs[2][3], double *x, double *y);

#endif /* CALC_EQN_H */
