Introduction
====================

- On the supercomputer Fugaku, open-source software packages (OSSs)
  are managed and provided with a package management tool Spack.

- Spack is adopted by the Exascale Computing Project (ECP) in U.S. For
  more details of Spack, please refer to the following URL:

    https://spack.readthedocs.io

  The current version of Spack on Fugaku is 1.0.1. The previous versions (0.21 and 0.19) are still available.

- The list of OSS which can be built on Fugaku by Spack is in the
  following URL:

  https://spack-mirror.r-ccs.riken.jp/oss/public/

  Note that the list does not reflect the latest status in the current
  environment of Fugaku.

- The usage explained in this document might be changed.

- Any of the OSSs might be replaced because of the upgrade of them or
  any other reasons.

- OSSs on Fugaku are not supported and we cannot accept questions or
  requests about their usage, problems, etc. in principle. It is
  users' responsibility to follow the license of each OSS.

Usage of OSSs
====================

To use an OSS on a login node, run the commands below on the
terminal of it. To use an OSS on a compute node, put the commands in a
job script or run them in the terminal of an interactive job.

For more detailed usage of Spack on Fugaku, refer to Spack User's
Guide for Fugaku.

- Setup Spack

  ::

     $ . /vol0004/apps/oss/spack/share/spack/setup-env.sh

- List installed packages

The ``spack find`` command lists installed packages. In the example
below, the packages in the  ``linux-rhel8-a64fx`` section is compute nodes, and 
``linux-rhel7-cascadelake`` and ``linux-rhel8-skylake_avx512`` for login nodes.

  ::

     $ spack find
     ...
     -- linux-rhel8-a64fx / %c,cxx,fortran=fj@4.12.0 -----------------
     adios2@2.9.2   adios2@2.10.2  cp2k@2025.2       
     fugaku-frontistr@master  lammps@20230802.4  libint@2.6.0
     ...
     -- linux-rhel8-cascadelake / %c,cxx,fortran=gcc@15.1.0 ----------
     adios2@2.9.2  darshan-util@3.4.0-pre1  openmpi@5.0.8
     ...
     ==> 1046 installed packages

- Load a package

  The ``spack load`` command activates the specified package.

  (Example) load openblas::

     $ spack load openblas

- Unload a package

  The ``spack unload`` command deactivates the specified package.

  (Example) unload openblas::

     $ spack unload openblas


Current Status
====================

The following OSSs are available at October 17th, 2025. We will make more
OSSs available on Fugaku. For the status of the previous version
0.21 (0.19), see :doc:`list_0.21` (:doc:`list_0.19`).

Note: Many other OSSs on which the followings are dependent are also
installed.

Packages installed on the login nodes
-----------------------------------------

.. csv-table::
   :file: oss_list_ln_1.0.1.csv

Packages installed on the compute nodes
-----------------------------------------

.. csv-table::
   :file: oss_list_cn_1.0.1.csv
