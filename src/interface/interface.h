#ifndef CALC_INTERFACE_H
#define CALC_INTERFACE_H

/**
 * Module : interface
 * Interface utilisateur CLI — affichage, historique, modes de calcul
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

void     cli_start(void);
void     cli_display_result(double val);
void     cli_display_error(const char *msg);
void     cli_set_format(int fmt, int digits);  /* fmt: 0=Norm 1=Fix 2=Sci */

#endif /* CALC_INTERFACE_H */
