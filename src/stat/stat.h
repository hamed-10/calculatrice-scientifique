#ifndef CALC_STAT_H
#define CALC_STAT_H

/**
 * Module : stat
 * Statistiques — mode STAT, 1-var, 2-var, régressions
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

void     stat_push(double x);
void     stat_push2(double x, double y);
double   stat_mean(void);
double   stat_stddev(void);
void     stat_clear(void);

#endif /* CALC_STAT_H */
