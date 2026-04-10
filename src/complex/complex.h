#ifndef CALC_COMPLEX_H
#define CALC_COMPLEX_H

/**
 * Module : complex
 * Nombres complexes — mode CMPLX, opérations, conversions polaires
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

typedef struct { double re; double im; } Complex;
Complex  cx_add(Complex a, Complex b);
Complex  cx_mul(Complex a, Complex b);
double   cx_mod(Complex a);
double   cx_arg(Complex a);

#endif /* CALC_COMPLEX_H */
