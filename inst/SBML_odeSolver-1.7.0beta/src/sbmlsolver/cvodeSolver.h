/*
  Last changed Time-stamp: <2007-06-12 15:43:40 xtof>
  $Id: cvodeSolver.h,v 1.10 2007/06/12 13:43:15 chfl Exp $
*/
/* 
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2.1 of the License, or
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
 * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. The software and
 * documentation provided hereunder is on an "as is" basis, and the
 * authors have no obligations to provide maintenance, support,
 * updates, enhancements or modifications.  In no event shall the
 * authors be liable to any party for direct, indirect, special,
 * incidental or consequential damages, including lost profits, arising
 * out of the use of this software and its documentation, even if the
 * authors have been advised of the possibility of such damage.  See
 * the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 *
 * The original code contained here was initially developed by:
 *
 *     Rainer Machne
 *
 * Contributor(s):
 *     Andrew Finney
 */

#ifndef _CVODESOLVER_H_
#define _CVODESOLVER_H_

#include "sbmlsolver/exportdefs.h"

#ifdef __cplusplus
extern "C" {
#endif


#define CVODE_HANDLE_ERROR(_flag, _function, _type)	\
  {  if (check_flag(_flag, _function, _type)) {		\
      SolverError_dump(); \
      return(0); }}
  
  /* CVODE SOLVER */
  SBML_ODESOLVER_API int IntegratorInstance_cvodeOneStep(integratorInstance_t *);
  SBML_ODESOLVER_API int IntegratorInstance_printCVODEStatistics(integratorInstance_t *, FILE *f);

  /* internal functions that are not part of the API (yet?) */
  int IntegratorInstance_createCVODESolverStructures(integratorInstance_t *);
  void IntegratorInstance_freeCVODESolverStructures(integratorInstance_t *);
  void IntegratorInstance_freeForwardSensitivity(integratorInstance_t *);
  void IntegratorInstance_freeAdjointSensitivity(integratorInstance_t *);
  int check_flag(void *flagvalue, char *funcname, int opt);
  
#ifdef __cplusplus
}
#endif

#endif

/* End of file */
