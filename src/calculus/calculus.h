#ifndef CALC_CALCULUS_H
#define CALC_CALCULUS_H

/**
 * Module : calculus
 * Calcul intégral et différentiel — intégrale numérique, dérivée, somme Σ
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

double   fn_integral(const char *expr, double a, double b);
double   fn_derivative(const char *expr, double x);
double   fn_sum(const char *expr, int start, int end);

#endif /* CALC_CALCULUS_H */
