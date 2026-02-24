:orphan:

MATLAB - 利用申請手続き
================================================================================

| 富岳フロントエンドサーバー向けに、インストール済みのMATLAB環境 (Intel版) を用意しています。
| アカデミック版とBYOL版（ライセンス持ち込み版）の2つのバージョンを用意しています。

1. 申請方法
-----------

| 以下のフローチャートを参照し、アカデミック版が利用可能かご確認下さい。
| アカデミック版が利用可能な場合、Zendeskから利用申請してください。
| アカデミック版の利用条件を満たさない場合、BYOL版のみ利用可能です。BYOL版は申請不要です。

.. figure:: FIGURES/matlab_ja.png
   :width: 800px

#. 富岳サポートサイトのお問い合わせ (https://fugaku.zendesk.com/hc/ja/requests/new) にアクセス
#. 「各種申請」を選択
#. 「お問い合わせ種別」から「商用アプリケーションの利用」を選択
#. 「課題ID」「件名」（例: 商用アプリケーション(MATLAB)利用開始等）、「利用者氏名」を入力
#. 「アプリケーション名」から「MATLAB」を選択
#. 「利用開始・停止希望」から「利用開始」を選択
#. 「注意事項」の同意チェックボックスにチェック
#. 「送信」を押す

.. 利用を希望する方は、お問い合わせ窓口(*)に下記情報を添えてお問い合わせください。

.. * 件名: MATLAB利用申請
.. * 課題ID
.. * アカウント名
.. * メールアドレス

.. (*) 窓口メールアドレス

.. * HPCI課題：helpdesk@hpci-office.jp
.. * それ以外：r-ccs-ungi-support@riken.jp

2. 留意事項
-----------

* BYOL版を利用するには、ユーザ自身が所有しているライセンスをログインノード、プリポスト環境に持ち込み、アクティベーションする必要があります。R-CCSはライセンスを提供しません。
* アカデミック版は、教育機関（大学、短大、大学校、高専等）に所属するユーザが利用できます。企業や理研以外の研究機関に所属の方は、ライセンス契約上利用できません。
* アプリケーションの利用に関する質問・サポートは、`MathWorks社のヘルプセンター <https://jp.mathworks.com/support/contact_us.html>`_ にお問い合わせ下さい。

3. 利用方法
-----------

ここでは、X-Windowを使用して、アクティベーションを進めます。

.. code-block:: console

    [PC]$ xhost +
    [PC]$ ssh -Y -i ~/.ssh/{your private key} {username}@fugaku.r-ccs.riken.jp

| 計算リソースを消費するクライアントであるため、プリポスト環境での起動を推奨致します。

.. code-block:: console

    [Login]$ srun --x11 -p gpu1 -n 72 --mem 186G --time=00:30:00 --pty bash -i

| アカデミック版の場合は、ログイン後、すぐにMatlabクライアントを起動することができます。

.. code-block:: console

    [PP]$ export TMPDIR=/tmp

    // for the Academic version
    [PP]$ cd /vol0004/apps/MATLAB_academic/R2023a/bin
    [PP]$ ./matlab

| BYOL版の場合は、アクティベーションが必要になります。
| ライセンスファイルは予めログインノードにアップロードしておく必要があります。

.. code-block:: console

    [PP]$ export TMPDIR=/tmp

    // for BYOL
    [PP]$ cd /vol0004/apps/MATLAB/R2023a/bin
    [PP]$ ./activate_matlab.sh

| BYOL版の手順は、以下となります。
| **"Activate automatically using the Internet"** を選択し、 **"Next"** ボタンを押します。

.. figure:: FIGURES/fig1.png
   :width: 800px

**"Enter the full path to your license file, including the file name"** を選択し、ライセンスファイルのパスをテキストフィールドに入力し、 **"Next"** ボタンを押します。

.. figure:: FIGURES/fig2.png
   :width: 800px

以下のダイアログが表示されれば終了です。

.. figure:: FIGURES/fig3.png
   :width: 800px

その後、再度 **matlab** を実行することで、アプリケーションが起動します。

.. code-block:: console

    [PP]$ ./matlab

利用方法についてはMathWorks社のホームページをご参照ください。


4. その他
---------

以下の製品がインストールされています。 （利用可能なアプリケーションは使用するライセンスに依存します。）

.. list-table:: Pre-installed Products

    * - MATLAB
    * - Simulink
    * - 5G Toolbox
    * - AUTOSAR Blockset
    * - Aerospace Blockset
    * - Aerospace Toolbox
    * - Antenna Toolbox
    * - Audio Toolbox
    * - Automated Driving Toolbox
    * - Bioinformatics Toolbox
    * - Communications Toolbox
    * - Computer Vision Toolbox
    * - Control System Toolbox
    * - Curve Fitting Toolbox
    * - DSP System Toolbox
    * - Data Acquisition Toolbox
    * - Database Toolbox
    * - Datafeed Toolbox
    * - Deep Learning HDL Toolbox
    * - Deep Learning Toolbox
    * - Econometrics Toolbox
    * - Financial Instruments Toolbox
    * - Financial Toolbox
    * - Fixed-Point Designer
    * - Fuzzy Logic Toolbox
    * - Global Optimization Toolbox
    * - Image Acquisition Toolbox
    * - Image Processing Toolbox
    * - Industrial Communication Toolbox
    * - Instrument Control Toolbox
    * - LTE Toolbox
    * - Lidar Toolbox
    * - MATLAB Report Generator
    * - Mapping Toolbox
    * - Mixed-Signal Blockset
    * - Model Predictive Control Toolbox
    * - Model-Based Calibration Toolbox
    * - Motor Control Blockset
    * - Navigation Toolbox
    * - Optimization Toolbox
    * - Parallel Computing Toolbox
    * - Partial Differential Equation Toolbox
    * - Phased Array System Toolbox
    * - Powertrain Blockset
    * - Predictive Maintenance Toolbox
    * - RF Blockset
    * - RF Toolbox
    * - ROS Toolbox
    * - Reinforcement Learning Toolbox
    * - Requirements Toolbox
    * - Risk Management Toolbox
    * - Robotics System Toolbox
    * - Robust Control Toolbox
    * - Sensor Fusion and Tracking Toolbox
    * - SerDes Toolbox
    * - Signal Processing Toolbox
    * - SimBiology
    * - SimEvents
    * - Simscape
    * - Simscape Driveline
    * - Simscape Electrical
    * - Simscape Fluids
    * - Simscape Multibody
    * - Simulink 3D Animation
    * - Simulink Check
    * - Simulink Control Design
    * - Simulink Coverage
    * - Simulink Design Optimization
    * - Simulink Design Verifier
    * - Simulink Desktop Real-Time
    * - Simulink Real-Time
    * - Simulink Report Generator
    * - Simulink Test
    * - SoC Blockset
    * - Spreadsheet Link
    * - Stateflow
    * - Statistics and Machine Learning Toolbox
    * - Symbolic Math Toolbox
    * - System Composer
    * - System Identification Toolbox
    * - Text Analytics Toolbox
    * - UAV Toolbox
    * - Vehicle Dynamics Blockset
    * - Vehicle Network Toolbox
    * - Vision HDL Toolbox
    * - WLAN Toolbox
    * - Wavelet Toolbox
    * - Wireless HDL Toolbox
