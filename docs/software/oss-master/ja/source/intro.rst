Spackとは
================================================================================

- Spackは主にスーパーコンピュータ向けのパッケージ管理ツールです。詳細は公式ページ https://spack.io/ をご覧ください。

- スーパーコンピュータ「富岳」ではSpackを用いてオープンソースソフトウェア（OSS）を管理、提供します。

- 利用頻度の高いOSSについては、システム側でSpackインスタンスを用意してビルド済みのOSSを提供します。この部分を「パブリック・インスタンス」と呼びます。

- 各ユーザがホームディレクトリ以下にSpackインスタンスを保持し各自でOSSをビルドして利用することもできます。この部分を「プライベート・インスタンス」と呼びます。

- プライベート・インスタンスを利用の際にも、「チェイニング」の機能を用いることでパブリック・インスタンスで提供されるビルド済みOSSを参照・利用可能です。この機能を用いることで、依存関係のために多数のOSSをビルドする負荷を軽減することができます。

- Spackは単一のインスタンスで複数の環境を混合して利用することができます。典型的には同一パッケージに対して

  - ログインノードのx86向けのビルド（GCC）

  - 計算ノードのA64FX向けのビルド（富士通コンパイラ）

  が共存できます。

パブリック・インスタンスの利用
================================================================================

.. contents::
  :local:

システム側でビルド済みのOSSを利用する場合、環境の読み込みのみで利用可能です。

.. note::
   ジョブでパブリック・インスタンスを利用する場合には、環境変数 ``PJM_LLIO_GFSCACHE`` に ``/vol0004`` を指定する必要があります。詳しくは、「利用手引書 －利用およびジョブ実行編－」の「\ `8.8. 利用ファイルシステム(volume)の選択 <https://www.fugaku.r-ccs.riken.jp/doc_root/ja/user_guides/use_latest/LayeredStorageAndLLIO/SelectAvailableVolumes.html>`_\ 」 をご参照ください。

.. _setup:

環境の読み込み
--------------------------------------------------------------------------------

コマンドラインで以下のようにすることでSpackが利用可能になります。
``bash`` の場合：

.. code-block:: bash

	$ . /vol0004/apps/oss/spack/share/spack/setup-env.sh

``csh``/``tcsh`` の場合：

.. code-block:: csh

	$ setenv SPACK_ROOT /vol0004/apps/oss/spack
	$ source /vol0004/apps/oss/spack/share/spack/setup-env.csh

バッチ型ジョブで利用する場合はジョブスクリプトにも同様の記述をしてください。

.. note::
   - ログインシェルの ``.bashrc`` 等にこの記述をすると、ファイルシステムにトラブルがあったとき最悪ログインすらできなくなるおそれがあるため現時点ではお勧めできません。
   - Spackは、環境変数 ``TMPDIR`` に指定されたディレクトリに、各種の作業ファイルを配置します。2025年10月17日現在、デフォルトの状態で ``TMPDIR`` はホームディレクトリに指定されているため、Spackを利用する際に「Disk quota exceeded」のエラーが発生する可能性があります。そのような場合には、以下のページに記載されている通り ``TMPDIR`` を指定してください。

     https://www.fugaku.r-ccs.riken.jp/operation/20220408_01


ビルド済みパッケージの確認
--------------------------------------------------------------------------------
コマンドラインで ::

	$ spack find -x

とすることで利用可能なOSSの一覧が得られます。 2025-10-17現在では以下のようになっています：

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

ここでは ``-x`` オプションにより明示的にインストールされたパッケージのみを表示していますが、実際にはこれらが依存する多数のパッケージもインストールされています。
``linux-rhel8-cascadelake`` または ``linux-rhel8-skylake_avx512`` がログインノード用、 ``linux-rhel8-a64fx`` が計算ノード用にビルドされたOSSであることをを示しています。

OSSのロード
--------------------------------------------------------------------------------

例えばtmuxを利用可能にしたい場合： ::

	$ spack load tmux

とすることで、必要な設定（環境変数 ``PATH`` など）が行われて利用可能になります。

.. 同じ名前のOSSがログインノード用にも計算ノード用にも存在する場合、自動で適切なものが選択されます。

.. OSSのアンロード
.. --------------------------------------------------------------------------------

同様に ::

	$ spack unload tmux

でアンロードできます。

.. note::
	以下のように、``module`` コマンドを利用してOSSをロード、アンロードすることもできます。 ::

	  $ module load tmux
	  $ module unload tmux
	
プライベート・インスタンスの利用
================================================================================

.. contents::
  :local:

**これ以降の内容は、自身でOSSをビルドするユーザにのみ必要とされる作業であり、システム側で提供するビルド済みOSSを利用するだけのユーザは行う必要がありません。**

各々のユーザのホームディレクトリ等にSpackインスタンスを保持し、ユーザがOSSをビルドして利用することができます。

リポジトリのクローン
--------------------------------------------------------------------------------

.. 簡単のため ``$(HOME)/spack`` へとインストールする方法を説明しますが、インストール先のディレクトリは任意です。
   
簡単のため ``$TMPDIR`` へインストールする方法を説明しますが (環境変数 ``TMPDIR`` の設定については、:ref:`setup` の章の注釈を参照)、インストール先のディレクトリは任意です。

.. code-block:: bash

	$ cd $TMPDIR
	$ git clone https://github.com/RIKEN-RCCS/spack.git
	$ cd spack
	$ git checkout fugaku-v1.0.1

クローンしてきた直後ではデフォルトのdevelopブランチですが、ここではfugaku-v1.0.1ブランチへと切り替えています。

.. .. note::
.. 	富岳で特定のブランチのみサポートする／しないというのはありません。

パブリック・インスタンス提供パッケージの利用
--------------------------------------------------------------------------------

ログインノードで一度環境を読み込みます。

.. code-block:: bash

	$ . $TMPDIR/spack/share/spack/setup-env.sh


Spackで提供される「チェイニング」の機能を用いることで、別のインスタンスにインストール済みのパッケージを利用することができます。ここで紹介する手順では、パブリック・インスタンスをアップストリームとして設定することで各々のプライベート・インスタンスから前者でインストール済みのパッケージを利用する設定を行います。 この機能を利用するには、 テキストファイル ``~/.spack/upstreams.yaml`` を以下の内容で作成してください： 

.. code-block:: yaml

	upstreams:
	  spack-public-instance:
	    install_tree: /vol0004/apps/oss/spack/opt/spack

この後

.. code-block:: bash

  $ spack compilers

としたとき、

.. code-block:: bash

  ==> Available compilers
  -- fj rhel8-x86_64 ----------------------------------------------
  [e]  fj@4.12.1  [e]  fj@4.12.0  [e]  fj@4.11.2  [e]  fj@4.11.1  [e]  fj@4.10.0
  
  -- gcc rhel8-aarch64 --------------------------------------------
  [^]  gcc@15.1.0  [^]  gcc@14.3.0  [^]  gcc@13.4.0
  
  -- gcc rhel8-x86_64 ---------------------------------------------
  [e]  gcc@8.5.0  [^]  gcc@15.1.0  [^]  gcc@14.3.0
  
  -- llvm rhel8-aarch64 -------------------------------------------
  [^]  llvm@20.1.6  [^]  llvm@19.1.7  [^]  llvm@18.1.8  [^]  llvm@17.0.6  [^]  llvm@16.0.6  [^]  llvm@14.0.6

のような出力があればコンパイラの設定は成功です。


さらに、

.. code-block:: bash

	$ spack repo add /vol0004/apps/oss/spack/var/spack/fugaku-packages/repos/spack_repo/fugaku/local
	$ spack repo add /vol0004/apps/oss/spack/var/spack/fugaku-packages/repos/spack_repo/fugaku/update
	$ spack repo add /vol0004/apps/oss/spack/var/spack/fugaku-packages/repos/spack_repo/fugaku/rist
	$ spack repo add /vol0004/apps/oss/spack/var/spack/fugaku-packages/repos/spack_repo/fugaku/rccs

として、ローカル・リポジトリを追加しておきます。

設定が完了したら、

.. code-block:: bash

	$ spack find

としてパブリック・インスタンス提供のパッケージが見えることを確認してください。

外部パッケージの登録
--------------------------------------------------------------------------------

富士通MPIを始めとする外部パッケージを利用するために、システム側から設定ファイルをコピーしてください。

.. code-block:: bash

        $ cp /vol0004/apps/oss/spack/etc/spack/packages.yaml ~/.spack/

..
   Fujitsu MPIの登録
   --------------------------------------------------------------------------------

   .. .. warning::
	   単にアップストリームの設定をしただけでもfujitsu-mpiは見えるようだが…

   .. MPIを利用するOSSを計算ノードで用いる場合、 ``fujitsu-mpi`` が外部パッケージとしてspackに登録されている必要があります。同様にBLAS/LAPACK/SCALAPACKを利用するOSSは ``fujitsu-ssl2`` が必要となります。この登録のためテキストファイル ``$(HOME)/.spack/linux/packages.yaml`` を以下の内容で作成してください：

   MPIを利用するOSSを計算ノードで用いる場合、 ``fujitsu-mpi`` が外部パッケージとしてspackに登録されている必要があります。この登録のためテキストファイル ``$(HOME)/.spack/linux/packages.yaml`` を以下の内容で作成してください：

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

   かわりにシステム側からこの内容のファイルをコピーしてくることもできます。

   .. code-block:: bash

	   cp /vol0004/apps/oss/spack/etc/spack/packages.yaml ~/.spack/linux/


   .. .. code-block:: bash

	   $ spack find fujitsu-mpi

   .. としたとき

   .. .. code-block:: bash

	   ==> 1 installed package
	   -- linux-rhel8-a64fx / fj@4.1.0 ---------------------------------

   .. と出力されれば成功です。

環境の読み込み
--------------------------------------------------------------------------------

ログイン後コマンドラインで以下のようにすることでSpackが利用可能になります。

bashの場合：

.. code-block:: bash

	$ . $TMPDIR/spack/share/spack/setup-env.sh

csh/tcshの場合：

.. code-block:: csh

	$ setenv SPACK_ROOT $TMPDIR/spack
	$ source $TMPDIR/spack/share/spack/setup-env.csh

パッケージのインストールと管理
--------------------------------------------------------------------------------

.. code-block:: bash

	$ spack list

とすることで入手可能な全てのパッケージが表示されます。このままでは7000以上のパッケージが表示されてしまいますが、文字列による絞り込みができます（大文字小文字は区別しない）。例えば、、

.. code-block:: bash

	$ spack list mpi

とすると、

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

			
のような出力が得られます。ここから例えば ``openmpi`` をインストールするには、

.. code-block:: bash

	$ spack install openmpi

とします。ここで ``openmpi@4.1.1`` のようにバージョンを明記することもできます。利用可能なバージョンやバリアント（ここでは説明は割愛します）を調べるには、

.. code-block:: bash

	$ spack info openmpi

としてください。

.. note::
	計算ノード用にパッケージをインストールするには会話型ジョブで計算ノードにログインして作業を行うか、インストール用のジョブスクリプトを投入する必要があります。

同様にアンインストールは

.. code-block:: bash

	$ spack uninstall openmpi

.. で行うことができます。同一名のパッケージが複数存在してそのうちのどれかを明示的に指定したい場合、7文字のハッシュ値を用いるのが便利です。

同一名のパッケージが複数存在する場合、Spackがパッケージを解決できずにエラーとなります。このエラーを避ける
には :ref:`sec-multiple-package` を参照してください。

.. .. code-block:: bash
.. 
.. 	$ spack find -l openmpi
.. 
.. とするとパッケージ名の左に7文字のハッシュ値が表示されるので、仮に ``abcdefg`` だとしたとき
.. 
.. .. code-block:: bash
.. 
.. 	$ spack uninstall /abcdefg
.. 
.. のように ``/`` （スラッシュ）以降にハッシュ値を与えることでアンインストールするパッケージを指定できます。

.. _sec-multiple-package:

同一名複数パッケージの区別
--------------------------------------------------------------------------------

しばしばひとつのインスタンス内もしくはチェイニングされたインスタンス間で同一名のパッケージが存在することがあります。複数のバージョンが同時にインストールされている場合、あるいは同一バージョンであってもログインノード向けのビルドと計算ノード向けのビルドがインストールされているケースがなどが考えられます。そのような場合、パッケージ名だけを指定して ``spack load`` を実行するだけでは、Spackはどのパッケージをロードするべきかを決められないため、エラーになります。

例えばパブリック・インスタンスで

.. code-block:: bash

	$ spack load screen

とすると

.. code-block:: bash

  ==> Error: screen matches multiple packages.
    Matching packages:
      e754igt screen@4.9.1 arch=linux-rhel8-a64fx %fj@4.12.0
      rkrpm6l screen@4.9.1 arch=linux-rhel8-cascadelake %gcc@15.1.0
    Use a more specific spec (e.g., prepend '/' to the hash).

のようなエラーとなります。同様の情報は

.. code-block:: bash

	spack find -lv screen

のようにしても得られます。以下、より詳細にパッケージ指定する方法をいくつか紹介していきます。

- ハッシュ値での指定：Spackではパッケージ名に詳細なビルド条件を付記した ``spec`` に対して一意にハッシュ値が定まるようになっています。 ``/`` （スラッシュ）以降に短縮ハッシュ値の7文字を書くことで、明示的に指定することができます。これまでの例と同様に

  .. code-block:: bash

	$ spack load /e754igt
	$ spack load /rkrpm6l

  のように指定できます。パブリック・インスタンスに同一名複数パッケージが存在する場合（例えば ``fftw`` 、依存するパッケージの違いによっても同一名複数パッケージが発生する場合があります）は、

  .. code-block:: bash

	$ spack find -lx

  で出てきたほうのパッケージをロードするようにしてください。（ ``-l`` は7文字の短縮ハッシュ値を表示するオプション、 ``-x`` はexplicitにインストールされたパッケージのみを表示するオプションです。）

- バージョン番号での指定：パッケージ名の後に ``@`` （アットマーク）を付け以降にバージョン場号を指定します。たとえば：

  .. code-block:: bash

	$ spack load screen@4.9.1

  （ただし今回の例では同様のエラーとなります。）

- ビルドしたコンパイラでの指定：パッケージ名の後に ``%`` （パーセント）を付け以降にビルドしたコンパイラを指定します。ログインノード向けの ``screen`` が ``gcc`` でコンパイルされていて計算ノード向けには富士通コンパイラ (``fj``) であるとき、

  .. code-block:: bash

	$ spack load screen%gcc
	$ spack load screen%fj

  のように区別が可能です。 更に詳細に ``screen%gcc@15.1.0`` や ``screen%fj@4.12.0`` のような記述も可能です。

- アーキテクチャでの指定：パッケージ名の後に ``arch=`` でビルド時のターゲットアーキテクチャを指定できます。ログインノードと計算ノードに対してそれぞれ

  .. code-block:: bash

	$ spack load screen arch=linux-rhel8-cascadelake
	$ spack load screen arch=linux-rhel8-a64fx

  のようになります。

..   .. note::
..     最初の例の ``haswell`` は実際にはログインノードのCPUアーキテクチャである ``cascadelake`` より古い世代になりますが、これはビルドに用いた ``gcc@4.8.5`` のバージョンが古いためです。

既知の問題と対処
================================================================================

.. 言語環境バージョンの不整合
.. --------------------------------------------------------------------------------

.. 2020/12時点での最新の言語環境は ``lang/tcsds-1.2.28a`` となります。しかしながらパブリック・インスタンスのビルドには ``lang/tcsds-1.2.27b`` を用いています。 このためパブリック・インスタンスのパッケージを ``spack load`` すると、言語環境の環境変数がランタイムパスを含めて ``lang/tcsds-1.2.27b`` で上書きされてしまうという事態が発生します。対処療法として以下のコマンドを実行することで、 ``lang/tcsds-1.2.28a`` が優先的に発見されるようにできます。

.. .. code-block:: bash
.. 
.. 	$ module unload lang/tcsds-1.2.28a
.. 	$ module load   lang/tcsds-1.2.28a


OS標準の動的ライブラリパスが上書きされる問題
--------------------------------------------------------------------------------

Spackで何らかのパッケージをロードした後、プログラム実行時に

.. code-block:: none

	[WARN] xos LPG 2002 - Failed to map HugeTLBfs for data/bss: /usr/bin/file
	The e_type of elf header must be ET_EXEC when using libmpg. You can
	check it on your load module by readelf -h command.
	[WARN] xos LPG 2003 - Failed to map HugeTLBfs for data/bss: Layout
	problem with segments 0 and 1:

という警告が出力されたり、

.. code-block:: none

	libmpg BUG!! mpiexec: __mpg_resolve_libc_symbol[776]: Assertion
	`__libc_calloc_fp != ((void *)0)' failed.


というエラーが発生する場合があります（前者の警告は無害ですので、無視できます）。また、ログインノードにおいても、一部のアプリケーション（e.g. emacs）の実行時にエラーが発生する場合があります。これらは、 ``spack load`` でパッケージを読み込んだ後に以下のように環境変数 ``LD_LIBRARY_PATH`` を再設定することで抑止できます。

.. code-block:: bash

	export LD_LIBRARY_PATH=/lib64:$LD_LIBRARY_PATH


マルチノードジョブにおける性能劣化
----------------------------------

Spackで提供するパッケージは第2階層ストレージ上に存在するため、マルチノードジョブからそれらを利用する場合、特定のストレージI/Oノードにアクセスが集中し、性能劣化を引き起こす可能性があります。

そのような場合には、 必要なすべてのパッケージをロードした後で、 ``LD_LIBRARY_PATH`` と ``PATH`` に設定されたパスに対して ``dir_transfer`` コマンドを実行すれば、参照される可能性のある共有ライブラリと実行ファイルを、第1階層ストレージ上の第2階層ストレージのキャッシュ領域へ配布することができます。これにより、アクセス集中による性能劣化を避けることができます。

``dir_transfer`` コマンドにより共有ライブラリと実行ファイルを配布する例を以下に示します。

.. code-block:: none

   spack load xxx
   echo $LD_LIBRARY_PATH | sed -e 's/:/\n/g' | grep '^/vol0004/apps/oss/spack' | xargs /home/system/tool/dir_transfer
   echo $PATH | sed -e 's/:/\n/g' | grep '^/vol0004/apps/oss/spack' | xargs /home/system/tool/dir_transfer


Python利用時のエラー
--------------------

SpackでインストールされたPythonモジュールを利用すると、以下のようなエラーが発生する場合があります。

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

このような場合には、必要な全てのPythonモジュールをロードした後、 ``spack find -lx python`` で表示されるPythonをロードすればエラーを回避できます (以下の例で、 ``abcdefg`` は、 ``spack find -lx python`` で表示されるPythonのハッシュ値)。
   
.. code-block:: bash

   $ spack load py-ase
   ...
   $ spack load /abcdefg


"matches multiple packages"のエラーが出る場合
---------------------------------------------

原則として ``spack find -lx`` で表示されるハッシュを指定してください。

Rustのコンパイルに時間がかかる場合
----------------------------------

SpackでインストールされたRustのコンパイルに時間がかかる場合、pjsubコマンドの--llioオプションでcn-read-cacheパラメータをoffに設定すると、改善されることがあります。

.. code-block:: bash

   $ pjsub --llio cn-read-cache=off job.sh

