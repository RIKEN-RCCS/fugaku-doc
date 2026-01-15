Spack
================================================================================

- Spack is package management software for supercomputer systems. For the details, see the official web site https://spack.io/.

- In the supercomputer Fugaku, we manage and provide open source software (OSS) through Spack.

- For frequently used OSS, we provide pre-built OSS in a Spack instance on the system side.
  We call this the "public instance".

- Users can keep their own Spack instance in their home directory and build OSS by themselves.
  We call this a "private instance".

- From a private instance, pre-built OSS served in the public instance is available by using a "chaining"
  functionality of Spack. This can save the user the cost of building many prerequisite packages.

- Single Spack instance can handle multiple environments. Therefore, for example, two builds can coexist for one package:

  - A build for x86 of the login node by GCC

  - A build for A64FX of the computing node by Fujitsu compiler

Using Public Instance
================================================================================

.. contents::
  :local:

To use pre-built OSS in the public instance, all that you have to do
is to source the environment script.

.. note::
   To use the public instance in a job on compute nodes, specify
   ``/vol0004`` in an environment variable
   ``PJM_LLIO_GFSCACHE``. Please refer to `8.8. Selecting a usage file
   system (volume)
   <https://www.fugaku.r-ccs.riken.jp/doc_root/en/user_guides/use_latest/LayeredStorageAndLLIO/SelectAvailableVolumes.html>`_
   in *Supercomputer Fugaku Users Guide - Use and job execution -* for
   more details.

.. _setup:

Sourcing environment script
--------------------------------------------------------------------------------

Type the following in the command line. For ``bash``:

.. code-block:: bash

	$ . /vol0004/apps/oss/spack/share/spack/setup-env.sh

and for ``csh``/``tcsh``:

.. code-block:: csh

        $ setenv SPACK_ROOT /vol0004/apps/oss/spack
	$ source /vol0004/apps/oss/spack/share/spack/setup-env.csh

For the batched jobs, insert that line to the job script.

.. note::
   - Currently, we do not recommend including this line to your login
     script ``.bashrc``, etc. A potential risk for login failure
     exists when the filesystem is not stable.
   - Spack put work files in the directory specified by an environment
     variable ``TMPDIR``. Since ``TMPDIR`` is set to your home
     directory as of October 17, 2025, you might encounter an error
     "Disk quota exceeded." In such case, please set ``TMPDIR`` in the
     way described in:

     https://www.fugaku.r-ccs.riken.jp/en/operation/20220408_01

Checking pre-built packages 
--------------------------------------------------------------------------------
Type in the command line::

	$ spack find -x

to show the list of available OSS. As for 2025-10-17, it is as follows:

.. code-block:: bash

   login4$ spack find -x

  -- linux-rhel8-a64fx / %c,cxx,fortran=fj@4.12.0 -----------------
  adios2@2.9.2
  adios2@2.9.2
  adios2@2.10.2
  adios2@2.10.2
  adios2@2.10.2
  adios2@2.10.2
  blitz@1.0.2
  cosma@2.6.6
  cp2k@2025.2
  cp2k@2025.2
  elpa@2023.05.001
  elpa@2023.05.001
  ffb@9.0
  ffx@03.01
  fugaku-frontistr@master
  hdf5@1.14.6
  kim-api@2.2.1
  lammps@20220623.2
  lammps@20230802.3
  lammps@20230802.4
  lammps@20230802.4
  lammps@20240829.2
  lammps@20250722.1
  lammps@20250722.1
  libint@2.6.0
  lis@2.1.7
  mptensor@0.3.0
  mvmc@1.3.0
  openblas@0.3.30
  parallel-netcdf@1.14.0
  paraview@5.13.3
  petsc@3.23.4
  pfapack@2014-09-17
  plumed@2.9.0
  py-scipy@1.8.1
  spglib@2.5.0
  suite-sparse@7.8.3

  -- linux-rhel8-a64fx / %c,cxx=fj@4.12.0 -------------------------
  alamode@1.5.0
  bcftools@1.21
  bedtools2@2.31.1
  boost@1.88.0
  cbc@2.10.11
  cmake@3.31.8
  eigen@3.4.0
  ffmpeg@6.1.1
  gmp@6.3.0
  gromacs@2023.5
  gromacs@2024.5
  gromacs@2024.6
  gromacs@2025.3
  htslib@1.21
  improved-rdock@main
  libint@2.6.0
  llvm@16.0.6
  mapsplice2@2.2.1
  mesa@25.0.5
  netcdf-cxx@4.2
  netcdf-cxx4@4.3.1
  onednn@3.0
  openbabel@3.1.1
  openfoam@2412
  openfoam-org@12
  openjdk@17.0.11_9
  parmetis@4.0.3
  povray@3.7.0.10
  py-matplotlib@3.10.3
  py-numpy@1.26.4
  py-numpy@2.2.6
  py-pandas@2.3.1
  py-pyarrow@16.1.0
  py-pymol@2.5.0
  py-scikit-learn@1.7.0
  python@3.13.5
  qt@5.15.16
  raja@2025.03.0
  rust@1.85.0
  samtools@1.19.2
  star@2.7.11b

  -- linux-rhel8-a64fx / %c,cxx=gcc@15.1.0 ------------------------
  llvm@20.1.6

  -- linux-rhel8-a64fx / %c,cxx=gcc@8.5.0 -------------------------
  ffmpeg@7.1
  gcc@13.4.0
  gcc@14.3.0
  gcc@15.1.0
  llvm@17.0.6
  llvm@18.1.8
  llvm@19.1.7
  llvm@20.1.6

  -- linux-rhel8-a64fx / %c,fortran=fj@4.12.0 ---------------------
  cblas@2015-06-06
  eigenexa@2.6
  ermod@0.3.6
  fujitsu-fftw@1.1.0
  hphi@3.5.1
  libxc@7.0.0
  netcdf-fortran@4.6.1
  netlib-scalapack@2.2.2
  openmx@3.9.9
  phase0@2024.01
  phase0@2024.01
  quantum-espresso@7.3.1
  quantum-espresso@7.4.1
  salmon-tddft@2.2.1

  -- linux-rhel8-a64fx / %c=fj@4.12.0 -----------------------------
  batchedblas@1.0
  bwa@0.7.17
  darshan-runtime@3.4.0
  grads@2.2.3
  gsl@2.8
  hdf5@1.14.6
  netcdf-c@4.9.2
  py-cftime@1.6.4
  py-h5py@3.13.0
  py-mpi4py@4.0.1
  py-netcdf4@1.7.2
  py-pysam@0.21.0
  py-spglib@2.0.2
  screen@4.9.1
  tmux@3.5a

  -- linux-rhel8-a64fx / %c=gcc@8.5.0 -----------------------------
  nano@8.0

  -- linux-rhel8-a64fx / %cxx=fj@4.12.0 ---------------------------
  biobambam2@2.0.177
  dssp@3.1.4

  -- linux-rhel8-a64fx / %fortran=fj@4.12.0 -----------------------
  akaikkr@2021v02
  fds@6.9.1
  ffx@03.01
  modylas-new@1.1.0
  modylas-new@1.1.0
  modylas-new@1.1.0
  smash@3.0.2
  zpares@0.9.6a

  -- linux-rhel8-a64fx / no compilers -----------------------------
  ffvhc-ace@0.1
  fujitsu-mpi@4.12.0
  fujitsu-ssl2@head
  hwloc@2.2.0
  picard@3.3.0
  py-ase@3.23.0
  py-dask@2024.7.1
  py-hypothesis@6.96.2
  py-ipykernel@6.29.5
  py-pip@25.1.1
  py-pydmd@0.3
  py-pygps@1.3.5
  py-pytest@8.2.1
  py-pytoml@0.1.21
  py-seaborn@0.13.2
  py-toml@0.10.2
  py-xarray@2024.7.0
  rist-fftw@3.3.9-272-g63d6bd70

  -- linux-rhel8-cascadelake / %c,cxx,fortran=gcc@15.1.0 ----------
  darshan-util@3.4.0-pre1

  -- linux-rhel8-cascadelake / %c,cxx=gcc@14.3.0 ------------------
  gcc@15.1.0
  openfoam@2412

  -- linux-rhel8-cascadelake / %c,cxx=gcc@15.1.0 ------------------
  boost@1.88.0
  cmake@3.31.8
  gnuplot@6.0.0
  imagemagick@7.1.1-39
  mercurial@6.7.3
  openfoam@2412
  openjdk@17.0.11_9
  python@3.13.5

  -- linux-rhel8-cascadelake / %c,fortran=gcc@15.1.0 --------------
  netcdf-fortran@4.6.1

  -- linux-rhel8-cascadelake / %c=gcc@15.1.0 ----------------------
  hdf5@1.14.6
  libxml2@2.13.5
  netcdf-c@4.9.2
  tmux@3.5a

  -- linux-rhel8-cascadelake / no compilers -----------------------
  global@6.6.14
  py-pip@25.1.1

  -- linux-rhel8-skylake_avx512 / %c,cxx,fortran=gcc@15.1.0 -------
  adios2@2.9.2

  -- linux-rhel8-skylake_avx512 / %c,cxx,fortran=gcc@8.5.0 --------
  adios2@2.9.2
  py-scipy@1.11.3

  -- linux-rhel8-skylake_avx512 / %c,cxx=gcc@15.1.0 ---------------
  openfoam-org@12

  -- linux-rhel8-skylake_avx512 / %c,cxx=gcc@8.5.0 ----------------
  gcc@14.3.0
  gcc@15.1.0

  -- linux-rhel8-skylake_avx512 / %c=gcc@8.5.0 --------------------
  hdf5@1.12.2
  nano@8.0
  py-mpi4py@3.1.4

  -- linux-rhel8-skylake_avx512 / no compilers --------------------
  py-phonopy@2.27.0
  ==> 173 installed packages


It only shows explicitly installed packages with an option ``-x``, tough many other dependent packages are installed.
``linux-rhel8-cascadelake`` or ``linux-rhel8-skylake_avx512`` shows packages for login nodes,
and those below ``linux-rhel8-a64fx`` are for compute nodes.

Loading OSS
--------------------------------------------------------------------------------

As an example case you want ``tmux`` ready to use, type: ::

	$ spack load tmux

then it becomes available by setting the environment (e.g. ``PATH`` variable).

.. 同じ名前のOSSがログインノード用にも計算ノード用にも存在する場合、自動で適切なものが選択されます。

.. OSSのアンロード
.. --------------------------------------------------------------------------------

Similarity, to unload the package type: ::

	$ spack unload tmux

.. note::
   You can use the ``module`` command to load and unload packages as follows::

	  $ module load tmux
	  $ module unload tmux
	  
Using Private Instance
================================================================================

.. contents::
  :local:


**The information below is only for the users who build OSS by themselves,
and not necessary for users who just use the pre-built OSS by the system side.**

Users can create their own Spack instance under their home directory and build OSS by themselves.

Cloning the repository
--------------------------------------------------------------------------------

.. Although the installation path is arbitrary, we assume that is ``$(HOME)/spack`` for simplicity.
.. Clone the GitHub repository with the following commands:

Although the installation path is arbitrary, we assume that is ``$TMPDIR``
for simplicity. For the setting of the environment variable
``TMPDIR``, please refer to the note in the section of :ref:`setup`.
     
Clone the GitHub repository with the following commands:

.. code-block:: bash

	$ cd $TMPDIR
	$ git clone https://github.com/RIKEN-RCCS/spack.git
	$ cd spack
	$ git checkout fugaku-v1.0.1

Just after cloning, its branch is set to the default ``develop``.
In this sample, we switch to the ``fugaku-v1.0.1`` branch.

.. .. note::
.. 	We do not assume a specific branch to be supported.

Compiler setup
--------------------------------------------------------------------------------

First, source the Spack environment in the login node:

.. code-block:: bash

	$ . ~/spack/share/spack/setup-env.sh

..
   Then, the following command automatically detects and registers available compilers:

   .. code-block:: bash

	   $ spack compiler find

   As a result, ``gcc@8.4.1`` of the login node is detected and registered.
   At this moment, configuration files and directories are created under ``$(HOME)/.spack/``.

   To build OSS for the computing nodes, we use Fujitsu compiler.
   To register Fujitsu compiler, we need to edit a text file.
   Please add the following under ``compilers:`` entry of the file ``$(HOME)/.spack/linux/compilers.yaml``:

   .. code-block:: yaml

   - compiler:
       spec: fj@4.8.0
       modules: []
       paths:
         cc: /opt/FJSVxtclanga/tcsds-1.2.35/bin/fcc
	 cxx: /opt/FJSVxtclanga/tcsds-1.2.35/bin/FCC
	 f77: /opt/FJSVxtclanga/tcsds-1.2.35/bin/frt
	 fc: /opt/FJSVxtclanga/tcsds-1.2.35/bin/frt
       flags: {}
       operating_system: rhel8
       target: aarch64
       environment:
         set:
	   fcc_ENV: -Nclang
           FCC_ENV: -Nclang
	 prepend_path:
	   PATH: /opt/FJSVxtclanga/tcsds-1.2.35/bin
           LD_LIBRARY_PATH: /opt/FJSVxtclanga/tcsds-1.2.35/lib64
       extra_rpaths: []

   An alternative simpler way is to copy the file ``compilers.yaml`` from the system side:

   .. code-block:: bash

	   cp /vol0004/apps/oss/spack/etc/spack/compilers.yaml ~/.spack/linux/

   This makes gcc for the login node and Fujitsu compiler for the compute node available.

After these settings, type:

.. code-block:: bash

	$ spack compilers

If you have an output

.. code-block:: bash

  ==> Available compilers
  -- fj rhel8-x86_64 ----------------------------------------------
  [e]  fj@4.12.0  [e]  fj@4.11.2  [e]  fj@4.11.1  [e]  fj@4.10.0
  
  -- gcc rhel8-aarch64 --------------------------------------------
  [+]  gcc@15.1.0  [+]  gcc@14.3.0  [+]  gcc@13.4.0
  
  -- gcc rhel8-x86_64 ---------------------------------------------
  [e]  gcc@8.5.0  [+]  gcc@15.1.0  [+]  gcc@14.3.0
  
  -- llvm rhel8-aarch64 -------------------------------------------
  [+]  llvm@20.1.6  [+]  llvm@19.1.7  [+]  llvm@18.1.8  [+]  llvm@17.0.6  [+]  llvm@16.0.6  [+]  llvm@14.0.6

the setup of compilers is successful.

Using the packages provided in the public instance
--------------------------------------------------------------------------------
Spack has a "chaining" functionality where an instance can refer packages installed in other instances.
Here, we introduce to set the public instance as an upstream of the private instance of each user
so that the packages installed in the public instance is available from the private instance.
For this functionality, create and edit a file ``~/.spack/upstreams.yaml`` as in the following:

.. code-block:: yaml

	upstreams:
	  spack-public-instance:
	    install_tree: /vol0004/apps/oss/spack/opt/spack

Then, type

.. code-block:: bash

	$ spack repo add /vol0004/apps/oss/spack/var/spack/repos/local

to register the local repository.
	    
After those, type

.. code-block:: bash

	$ spack find

to ensure that you find the OSS provided by the public instance.

Registering external packages
--------------------------------------------------------------------------------

Copy ``packages.yaml`` from the system to use external packages such
as Fujitsu MPI.

.. code-block:: bash

        $ cp /vol0004/apps/oss/spack/etc/spack/packages.yaml ~/.spack/linux/

..
   Registering Fujitsu MPI
   --------------------------------------------------------------------------------

   .. .. warning::
	   単にアップストリームの設定をしただけでもfujitsu-mpiは見えるようだが…

   In case you use OSS requiring MPI in the compute nodes, it needs fujitsu-mpi to be registered
   as an external package of Spack.
   For that purpose, create a text file ``$(HOME)/.spack/linux/packages.yaml`` as follows:

   .. code-block:: yaml

	   packages:
	      all:
		 providers:
		   mpi: [fujitsu-mpi, openmpi, mpich]
		   blas: [openblas]
		   lapack: [openblas]
		   scalapack: [netlib-scalapack]
		   fftw-api: [fujitsu-fftw, fftw]
		 permissions:
		   write: group
	      fujitsu-mpi:
		 externals:
		 - spec: "fujitsu-mpi@4.3.1%fj arch=linux-rhel8-a64fx"
		   modules:
		   - lang/tcsds-1.2.29
		 buildable: False
	      fujitsu-ssl2:
		 externals:
		 - spec: "fujitsu-ssl2@4.3.1%fj arch=linux-rhel8-a64fx"
		   prefix: /opt/FJSVxtclanga/tcsds-1.2.29
		 buildable: False

   You can also copy this file from the system instead of editing it:

   .. code-block:: bash

	   cp /vol0004/apps/oss/spack/etc/spack/packages.yaml ~/.spack/linux/

   .. .. code-block:: bash

	   $ spack find fujitsu-mpi

   .. としたとき

   .. .. code-block:: bash

	   ==> 1 installed package
	   -- linux-rhel8-a64fx / fj@4.1.0 ---------------------------------

   .. と出力されれば成功です。

Sourcing the environments
--------------------------------------------------------------------------------

Spack is available or refreshed after sourcing the script by typing as follows.

For ``bash``:

.. code-block:: bash

	$ . ~/spack/share/spack/setup-env.sh

For ``csh``/``tcsh``:

.. code-block:: csh

	% . ~/spack/share/spack/setup-env.csh

Installation and management of packages
--------------------------------------------------------------------------------

By typing

.. code-block:: bash

	$ spack list

all the available packages in Spack (more than 7000) are listed.
You can narrow the list by a case-insensitive string, e.g.:

.. code-block:: bash

	$ spack list mpi

This results in:

.. code-block:: bash

  armcimpi                        mpi-sync-clocks  mpix-launch-swift               py-mpi4py
  compiler-wrapper                mpi-test-suite   msmpi                           py-pytest-mpi
  compiz                          mpibenchmark     openmpi                         py-tempita
  cray-mpich                      mpibind          pbmpi                           r-rmpi
  exempi                          mpich            pdiplugin-mpi                   rempi
  fujitsu-mpi                     mpidiff          perl-apache-logformat-compiler  rkt-compiler-lib
  hpcx-mpi                        mpifileutils     perl-params-validationcompiler  spectrum-mpi
  intel-mpi-benchmarks            mpigraph         perl-posix-strftime-compiler    spiral-package-mpi
  intel-oneapi-compilers          mpilander        phylobayesmpi                   sst-dumpi
  intel-oneapi-compilers-classic  mpileaks         pnmpi                           tiny-tensor-compiler
  intel-oneapi-mpi                mpip             py-dask-mpi                     umpire
  mpi-bash                        mpir             py-fluidfft-fftwmpi             vampirtrace
  mpi-rockstar                    mpitrampoline    py-fluidfft-mpi-with-fftw       wi4mpi
  mpi-serial                      mpiwrapper       py-mpi4jax
  ==> 55 packages

To install ``openmpi``, for example:

.. code-block:: bash

	$ spack install openmpi

The version can be explicitly indicated like ``openmpi@4.1.1``.
To inquire available versions and variants (we omit the detail about it), type:

.. code-block:: bash

	$ spack info openmpi

.. note::
	In order to build packages for the compute nodes, users need to log in a compute node with an interactive job or to submit a job script.

Similarly, to uninstall it, type:

.. code-block:: bash

	$ spack uninstall openmpi

When multiple packages in the same name are installed, Spack cannot identify the target package
and this causes an error.
To solve this situation, refer to :ref:`sec-multiple-package`.

.. In case multiple packages with an identical name exist, 
.. they can be distinguished by a hash in 7 letters.
.. To show the hash, type:
.. 
.. .. code-block:: bash
.. 
.. 	$ spack find -l openmpi
.. 
.. Assuming a package with its hash ``abcdefg``, it can be uninstalled by:
.. 
.. .. code-block:: bash
.. 
.. 	$ spack uninstall /abcdefg
.. 
.. Put the hash string after ``/`` (slash) to indicate the corresponding package.

.. _sec-multiple-package:

Resolving multiple packages with the same name
--------------------------------------------------------------------------------

Sometimes multiple packages with the same name are installed in a Spack instance or among
chained instances.
It happens when different versions of a package or multiple builds for different architectures
(e.g. login nodes and compute nodes) are installed.
In such a case, just passing the package name to spack commands such as ``spack load`` causes an error
because Spack cannot identify the target package uniquely.

For example, in the public instance:

.. code-block:: bash

	$ spack load screen

will result in an error:

.. code-block:: bash

  ==> Error: screen matches multiple packages.
    Matching packages:
      e754igt screen@4.9.1 arch=linux-rhel8-a64fx %fj@4.12.0
      rkrpm6l screen@4.9.1 arch=linux-rhel8-cascadelake %gcc@15.1.0
    Use a more specific spec (e.g., prepend '/' to the hash).

Similar information is also available in a command

.. code-block:: bash

	spack find -lv screen

In the following, we will introduce several ways to explicitly identify a package.

- Specifying the hash: Spack defines a unique hash for a build with its detailed conditions, ``spec``.
  You can uniquely specify a package build by its short hash in 7 letters after ``/`` (slash).
  For example:

  .. code-block:: bash

	$ spack load /e754igt
	$ spack load /rkrpm6l

  In case multiple packages in the same name exit in the public instance (ex. ``fftw``; sometimes multiple packages with different dependent packages can exist), load the package shown in the following:

  .. code-block:: bash

	$ spack find -lx

  Option ``-l`` shows short hash in 7 letters and ``-x`` only shows explicitly installed packages.


.. - バージョン番号での指定：パッケージ名の後に ``@`` （アットマーク）を付け以降にバージョン場号を指定します。たとえば：

- Specifying the version: After the package name, put ``@`` (at) followed by its version, e.g.:

  .. code-block:: bash

	$ spack load screen@4.9.1

  (It remains to be an error in our example case.)

- Specifying the compiler that built the package: You can indicate the compiler name after ``%`` (percent).
  When ``screen`` for the login nodes is compiled by ``gcc`` and that for the login nodes ``fj``, 
  you can distinguish them by

  .. code-block:: bash

	$ spack load screen%gcc
	$ spack load screen%fj

  In more detail, you can specify the version of the compilers as in ``screen%gcc@15.1.0`` or ``screen%fj@4.12.0``.

- Specifying the target architecture: Following the package name, you can specify the 
  architecture name of the package after ``arch=``.
  The builds for the login and compute nodes can be distinguished as follows:

  .. code-block:: bash

	$ spack load screen arch=linux-rhel8-cascadelake
	$ spack load screen arch=linux-rhel8-a64fx

..  .. note::
..    The former ``haswell`` is an old generation to the processor architecture of the login nodes ``cacadelake``.
..    This is because the compiler used for the build ``gcc@4.8.5`` is old and does not support the latest architectures.

.. - ハッシュ値での指定：Spackではパッケージ名に詳細なビルド条件を付記した ``spec`` に対して一意にハッシュ値が定まるようになっています。 ``/`` （スラッシュ）以降に短縮ハッシュ値の7文字を書くことで、明示的に指定することができます。これまでの例と同様に

Known issues and remedies
================================================================================

Path of dynamic link libraries of the operating system
--------------------------------------------------------------------------------

When executing a program after loading some of spack packages,
you may have warnings:

.. code-block:: none

	[WARN] xos LPG 2002 - Failed to map HugeTLBfs for data/bss: /usr/bin/file
	The e_type of elf header must be ET_EXEC when using libmpg. You can
	check it on your load module by readelf -h command.
	[WARN] xos LPG 2003 - Failed to map HugeTLBfs for data/bss: Layout
	problem with segments 0 and 1:

or an error:

.. code-block:: none

	libmpg BUG!! mpiexec: __mpg_resolve_libc_symbol[776]: Assertion
	`__libc_calloc_fp != ((void *)0)' failed.

You can just ignore the former warning. Also on the login nodes, some
applications (i.e. emacs) might cause an error.

To avoid these messages, set the environment variable ``LD_LIBRARY_PATH`` again as follows
after you call ``spack load`` command:

.. というエラーが発生する場合があります（前者の警告は無害ですので、無視できます）。 これらは、以下のように環境変数 ``LD_LIBRARY_PATH`` を設定することで抑止できます。

.. code-block:: bash

	export LD_LIBRARY_PATH=/lib64:$LD_LIBRARY_PATH

Performance Degradation in Multi-node Jobs
------------------------------------------

Packages provided via Spack are stored on the second-layer
storage. Therefore, if you use the packages in a multi-node job, the
performance may degrade due to concentrated access on a certain
storage I/O node.

In such cases, you can distribute all of the files to be referenced,
to the cache area of second-layer storage, which is on first-layer
storage, by running the ``dir_transfer`` command for the paths
in ``LD_LIBRARY_PATH`` and ``PATH``. Thus, the performance
degradation can be avoided.

An example of the ``dir_transfer`` command to distribute shared
libraries and executable files is as follows:

.. code-block:: none

   spack load xxx
   echo $LD_LIBRARY_PATH | sed -e 's/:/\n/g' | grep '^/vol0004/apps/oss/spack' | xargs /home/system/tool/dir_transfer
   echo $PATH | sed -e 's/:/\n/g' | grep '^/vol0004/apps/oss/spack' | xargs /home/system/tool/dir_transfer

Error in using Python
---------------------

When you use some Python modules installed with Spack, you might
encounter an error as follows.

.. code-block:: bash
		
   $ spack load py-ase %fj
   $ python3
   Python 3.8.12 (default, Nov 30 2021, 04:44:05)
   [Clang 7.1.0 ] on linux
   Type "help", "copyright", "credits" or "license" for more information.
   >>> import matplotlib
   ...
   >>> plt.savefig('fig.png',format='png')
   jwe0020i-u An error was detected during an abnormal termination process.
   jwe0020i-u An error was detected during an abnormal termination process.
   ...

In such cases, you could avoid the error by loading the
explicitly-installed python, which is
indicated by ``spack find -lx python``, after loading all of the
modules you need. Note that ``abcdefg`` in the example below is a hash
for the explicitly-installed python.

.. code-block:: bash

   $ spack load py-ase
   ...
   $ spack load /abcdefg


matches multiple packages error
-----------------------------------

If you get the ``matches multiple packages`` error, usually specify the hash displayed by ``spack find -lx``.

If Rust compilation takes a long time?
--------------------------------------

If Rust installed with Spack takes a long time to compile, try setting the ``cn-read-cache`` parameter to ``off`` in the ``--llio`` option of the ``pjsub`` command. 

.. code-block:: bash

   $ pjsub --llio cn-read-cache=off job.sh

