#ifndef CALC_MEMORY_H
#define CALC_MEMORY_H

/**
 * Module : memory
 * Mémoire et variables — Ans, variables A-Y, mémoire M, historique
 *
 * Groupe responsable : (à compléter)
 * NE PAS MODIFIER ce fichier sans accord du groupe responsable
 * et validation du chef de projet. Toute demande de modification
 * passe par une GitHub Issue avec le label "interface".
 */

void     ans_store(double val);
double   ans_recall(void);
void     var_store(char name, double val);
double   var_recall(char name);
void     mem_plus(double val);
double   mem_recall(void);
void     mem_clear(void);

#endif /* CALC_MEMORY_H */
