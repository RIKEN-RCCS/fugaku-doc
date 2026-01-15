Spack v0.17.0
====================

Packages installed on the login nodes
-----------------------------------------

.. csv-table::
   :file: oss_list_ln_0.17.csv

Packages installed on the compute nodes
-----------------------------------------

.. csv-table::
   :file: oss_list_cn_0.17.csv
	  
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

\*3 User registration is needed to obtain the source code of
NAMD. Please obtain it for yourself and install it into your own `private
instance
<https://www.fugaku.r-ccs.riken.jp/doc_root/en/user_guides/FugakuSpackGuide/intro.html#id5>`_
of Spack in the following way.

::

   $ tar xzf NAMD_2.14_Source.tar.gz
   $ cd NAMD_2.14_Source
   $ spack dev-build namd
