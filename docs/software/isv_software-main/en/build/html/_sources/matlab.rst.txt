:orphan:

MATLAB - Application Information
================================================================================

| R-CCS provides a pre-installed MATLAB (Intel version) environment for the front-end servers of Fugaku.
| Two versions (Academic and Bring Your Own License versions) are available.

1. Application method
---------------------

| Please refer to the flowchart below to check if the academic version is available.
| If the academic version is available, please apply from Zendesk.
| If the conditions for the academic version are not met, only the BYOL version is available. The BYOL version does not require an application.

.. figure:: FIGURES/matlab_en.png
   :width: 800px

#. Access the request form (https://fugaku.zendesk.com/hc/en-us/requests/new) of Fugaku Support Site.
#. First, select the "Request form" pull-down menu.
#. Select "Use of commercial application" from the "Inquiry type" menu.
#. Input the "Project ID", "Subject" and "User name" forms.
#. Select "MATLAB" from the "Application name" menu.
#. Select "Application to start" from the "Request to start/stop use" menu.
#. Check the "Agreed to the precautions" box.
#. Push the "Submit" button.

.. If you wish to use MATLAB, please contact the support desk (*) with the following information.

.. * Subject: Application to use Vampir
.. * Project ID
.. * User Account
.. * E-mail address

.. (*) Contact e-mail address

.. * HPCI project: helpdesk@hpci-office.jp
.. * Others: r-ccs-ungi-support@riken.jp

2. Note
-------

* To use the BYOL version, Fugaku users must only bring their own license to the login nodes or the pre/post environment and activates the license by themself. R-CCS does not provide a license.
* For the Academic version, the users belonging to educational institutions (universities, colleges, colleges of technology, etc) can use it. On the other hand, those who belong to companies or research institutes except for RIKEN are not allowed to use it due to the license agreement.
* For questions or assistance in using the application, please contact the `MathWorks help center <https://jp.mathworks.com/support/contact_us.html>`_.

.. * If you are a non-resident, we need to submit a non-resident check form to abide by compliance. In such cases, additional information may be requested. Finally, we will approve/deny your application based on the fact.

3. How to use
-------------

In this guide, we will use X-Window to proceed with the activation.

.. code-block:: console

    [PC]$ xhost +
    [PC]$ ssh -Y -i ~/.ssh/{your private key} {username}@fugaku.r-ccs.riken.jp

| We recommend running the MATLAB client in the pre/post environment since the client consumes significant computing resources.

.. code-block:: console

    [Login]$ srun --x11 -p gpu1 -n 72 --mem 186G --time=00:30:00 --pty bash -i

| For the academic version, users can start the Matlab client without additional steps after logging in.

.. code-block:: console

    [PP]$ export TMPDIR=/tmp

    // for the Academic version
    [PP]$ cd /vol0004/apps/MATLAB_academic/R2023a/bin
    [PP]$ ./matlab

| For the BYOL version, users need activation steps.
| The license file should be uploaded to a Fugaku login node beforehand.

.. code-block:: console

    [PP]$ export TMPDIR=/tmp

    // for BYOL
    [PP]$ cd /vol0004/apps/MATLAB/R2023a/bin
    [PP]$ ./activate_matlab.sh

| The steps for the BYOL version are as follow.
| Select **"Activate automatically using the Internet"** and press the **"Next"**  button.

.. figure:: FIGURES/fig1.png
   :width: 800px

Select **"Enter the full path to your license file, including the file name"** and enter the path to the license file in the text field. Then press the **"Next"** button.

.. figure:: FIGURES/fig2.png
   :width: 800px

If the following dialogue appears, the activation may be completed.

.. figure:: FIGURES/fig3.png
   :width: 800px

Then run **matlab** again to start the application.

.. code-block:: console

    [PP]$ ./matlab

Please refer to the MathWorks website for details on how to use the tools.

4. MISC
-------

The following products are installed. (Available applications depend on your license conditions.)

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
