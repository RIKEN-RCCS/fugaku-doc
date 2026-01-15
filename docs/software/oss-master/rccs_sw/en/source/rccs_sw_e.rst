=================
R-CCS Software
=================

The "R-CCS Software" packages developed by RIKEN Center for
Computational Science are available on Fugaku.

If you have any questions or requests about the packages, please 
contact to `Fugaku Support Site
<https://fugaku.zendesk.com/hc/en-us/>`_ or the dedicated one of each
of the packages.

.. McKernel

MPICH on Tofu
=================

.. list-table::
   :widths: 1, 4

   * - Description
     - MPICH for Tofu
   * - Version
     - master
   * - Developed by
     - Fragship 2020 Project
   * - License
     - MPICH License
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - https://github.com/yutaka-ishikawa/mpich-tofu/wiki
   * - How to use
     - | ``spack load mpich-tofu%gcc ~mt`` for MPI with single thread  (available in Spack-v0.21/0.19)
       | ``spack load mpich-tofu%gcc +mt`` for MPI with multiple thread (available in Spack-v0.21/0.19)

..
      * - Contact Information
	- mpich-tofu-info@googlegroups.com

  
IHK/McKernel
==========================

.. list-table::
   :widths: 1, 4

   * - Description
     - light-weight multi-kernel operating system designed for high-end supercomputing
   * - Version
     - 1.7.0
   * - Developed by
     - Fragship 2020 Project
   * - License
     - GPL
   * - Provided support includes
     - support suspended
   * - Webpage
     - https://ihkmckernel.readthedocs.io/en/latest/
   * - Contact Information
     - ihkmckernel@googlegroups.com


Omni XcalableMP
=================

.. list-table::
   :widths: 1, 4

   * - Description
     - compiler for the XcalableMP PGAS language for distributed-memory computers
   * - Version
     - 1.3.3
   * - Developed by
     - Programming Environment Research Team
   * - License
     - LGPL-3.0
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - https://omni-compiler.org/
   * - How to use
     - ``spack load omni-compiler`` (available in Spack-v0.21/0.19)
   * - Contact Information
     - support@xcalablemp.org

       
EigenExa
=================

.. list-table::
   :widths: 1, 4

   * - Description
     - a high-performance eigenvalue solver
   * - Version
     - 2.6
   * - Developed by
     - Large-scale Parallel Numerical Computing Technology Research
       Team
   * - License
     - BSD 2-clause license
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - https://www.r-ccs.riken.jp/labs/lpnctrt/projects/eigenexa/index.html
   * - How to use
     - ``spack load eigenexa``
   * - Contact Information
     - EigenExa@ml.riken.jp
    

SC-SUMMA-25D (Semi-ScaLAPACK-Compatible 2.5D-PxGEMM based on SUMMA)
=======================================================================

.. list-table::
   :widths: 1, 4

   * - Description
     - XXXXXXX
   * - Version
     - 1.0 alpha
   * - Developed by
     - Large-scale Parallel Numerical Computing Technology Research
       Team
   * - License
     - MIT License
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - https://www.r-ccs.riken.jp/labs/lpnctrt/projects/25dpdgemm/
   * - How to use
     - ``spack load scsumma25d`` (available in Spack-v0.21/0.19)
   * - Contact Information
     - daichi.mukunoki@riken.jp


Batched Blas Generator
========================

.. list-table::
   :widths: 1, 4

   * - Description
     - XXXXXXXXXX
   * - Version
     - 1.0
   * - Developed by
     - Large-scale Parallel Numerical Computing Technology Research
       Team
   * - License
     - BSD 2-clause license
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - https://www.r-ccs.riken.jp/labs/lpnctrt/projects/batchedblas/
   * - How to use
     - ``spack load batchedblas``
   * - Contact Information
     - daichi.mukunoki@ml.riken.jp

GENESIS (GENeralized-Ensemble SImulation System)
==================================================

.. list-table::
   :widths: 1, 4

   * - Description
     - molecular dynamics and modeling software for bimolecular
       systems such as proteins, lipids, nucleic acids, glycans, and
       their complexes
   * - Version
     - 2.1.4
   * - Developed by
     - Computational Biophysics Research Team
   * - License
     - LGPL-3.0
   * - Provided support includes
     - answering questions, bug fixing
   * - Webpage
     - https://www.r-ccs.riken.jp/labs/cbrt/
   * - How to use
     - ``spack load genesis`` (available in Spack-v0.21/0.19)
   * - Contact Information
     - The contact information is currently closed. We will contact you again when it reopens.
..     - https://www.r-ccs.riken.jp/labs/cbrt/genesis-forum/


NTChem
======

.. list-table::
   :widths: 1, 4

   * - Description
     - a high-Performance software package for the molecular electronic structure
       calculation
   * - Version
     - 24.04
   * - Developed by
     - Computational Molecular Science Research Team
   * - License
     - The executable file is available for free; the source code is unpublished.
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - | https://molsc.riken.jp/ntchem_e.html
       | https://www.r-ccs.riken.jp/software_center/software/ntchem/overview/
   * - How to use
     - ``spack load ntchem`` (available in Spack-v0.21/0.19)
   * - Contact Information
     - nakajima@riken.jp

SCALE
=====

.. list-table::
   :widths: 1, 4

   * - Description
     - a basic library for weather and climate model of the earth and
       planets aimed to be widely used in various models
   * - Version
     - 5.5.2
   * - Developed by
     - Computational Climate Science Research Team
   * - License
     - | SCALE license
       | https://scale.riken.jp/license/
   * - Provided support includes
     - answering questions, bug fixing, feature enhancement, etc.
   * - Webpage
     - https://scale.riken.jp/
   * - How to use
     - ``spack load scale`` (available in Spack-v0.21/0.19)
   * - Contact Information
     - scale@ml.riken.jp

FrontFlow/red-HPC
=================

.. list-table::
   :widths: 1, 4

   * - Description
     - General-purpose thermal fluid modeling software for analyzing
       large flow fields with complicated geometries, like those
       arising in studies of gas turbines or automobile aerodynamics
   * - Version
     - 3.1
   * - Developed by
     - Complex Phenomena Unified Simulation Research Team
   * - License
     - Only executable file is available for free; source code is not open.
   * - Provided support includes
     - answering questions, bug fixing
   * - Webpage
     - | https://cfml.eng.hokudai.ac.jp/frontflow-red-ver-3-1.html
       | http://www.ciss.iis.u-tokyo.ac.jp/dl/
       | http://www.nufd.jp/product/nufd_frontflowred_2.html
   * - How to use
     - Please contact by email to get the access to FrontFlow/red-HPC.
   * - Contact Information
     - mtsubo@riken.jp
       
