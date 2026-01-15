Spack v0.19.0
====================

Packages installed on the login nodes
-----------------------------------------

.. csv-table::
   :file: oss_list_ln_0.19.csv

Packages installed on the compute nodes
-----------------------------------------

.. csv-table::
   :file: oss_list_cn_0.19.csv
	  
\*1 The following four applications are supported by Research Organization for Information Science and Technology (RIST).

- Quantum ESPRESSO
- LAMMPS
- GROMACS
- OpenFOAM

For more details on their usage, please refer to:

    https://www.hpci-office.jp/pages/appli_software
	  
\*2 The following warning message is generated at the configuration or the execution but it does not affect the behavior of the program.

::
   
   ==> Warning: Quotes in command arguments can confuse scripts like configure.
   The following arguments may cause problems when executed:
   source /dev/null &> /dev/null && python3 -c "import os, json; print(json.dumps(dict(os.environ)))"
   Quotes aren't needed because spack doesn't use a shell.
   Consider removing them

