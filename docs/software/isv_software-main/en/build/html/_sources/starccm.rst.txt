:orphan:

.. toctree::
   :maxdepth: 2
   :numbered:

.. highlight:: none

Simcenter STAR-CCM+  - Flow to Start Using
==============================================

The step to using Simcenter STAR-CCM+ on Fugaku are as follows.

Note that some procedures depend on the activation method used.


- When using the license server on Fugaku : Go to Step No 1-6
- When using such as a PoD authentication method, not using the license server on Fugaku : Go to Step No 1,4-6


#. License Agreement
#. Inquiry for license server information
#. Contacting License Server Information
#. Application for use and request for change of application contents
#. Notice of completion for software configuration
#. How to use

.. figure:: FIGURES/starccm1.png
   :width: 6.29921in

   Fig. 1. Workflow of using Simcenter STAR-CCM+ (When using the license server on Fugaku)

.. figure:: FIGURES/starccm2.png
   :width: 6.29921in
 
   Fig. 2. Workflow of using Simcenter STAR-CCM+ (When using such as a PoD authentication method, not using the license server on Fugaku)


1. License Agreement
-----------------------

A license agreement is required to use Simcenter STAR-CCM+ on Fugaku.

Please contact the following software vendor for details of the license agreement.

   **[Software Vendors]**

   Siemens Digital Industries Software

   **[Product Information]**

   https://plm.sw.siemens.com/en-US/simcenter/fluids-thermal-simulation/star-ccm/ 

   **[Contact]**
   
   https://plm.sw.siemens.com/en-US/contact-plm/

2. Inquiry for license server information
---------------------------------------------

If you want to use a license server on Fugaku, please contact Fugaku Support for license server information using the template below after signing the license agreement.
This step is not necessary if you use such as a PoD authentication method, not using the license server on Fugaku. Go to Step No 4.

**As a rule, license server information does not change.When updating the expiration date of a license file, the same license server information should be used.**

#. Access to Fugaku Support site (https://fugaku.zendesk.com/hc/en-us) and press "Request"
#. Select "Use of commercial application" from "Request type"
#. Select "Project ID" from "Project ID for this request"
#. Enter "License Server Information Inquiry" in "Subject"
#. Select "STAR-CCM+" from "Application Name"
#. Press "Submit"

The Fugaku Support will notify you of the license server information.

3. Contacting License Server Information
--------------------------------------------

Please contact the licensee with the license server information notified by the Fugaku Support in the "Inquiry for License Server Information" section.
This step is not necessary if you use such as a PoD authentication method, not using the license server on Fugaku. Go to Step No 4.

4. Application for use and request for change of application contents
-------------------------------------------------------------------------

If you want to use a license server on Fugaku, after receiving the license file from the licensee, please follow the procedure below to send the license file. The license file will be registered and configured by the commercial software maintenance staff.

If you want to use such as a PoD authentication method, not using the license server on Fugaku, follow the steps below after signing the license agreement.

Please be sure to include the Fugaku local account of one representative and all members who will use the license.

Please follow the same procedure when you change the application contents. Please be sure to include the Fugaku local account of one representative designated at the time of registration. The license file does not need to be attached if there are no changes.

#. Access to Fugaku Support site (https://fugaku.zendesk.com/hc/en-us) and press "Request"
#. Select "Use of commercial application" from "Request type"
#. Select "Project ID" from "Project ID for this request"
#. Enter "EXAMPLE: Start of use (STAR-CCM+)" in "Subject"
#. Select "STAR-CCM+" from "Application Name"
#. Enter inquiry details in "Supplement" with reference to the following [Sample]
#. Attach the license file if necessary
#. Press "Submit"

- [Sample 1] Register a new license file

::
   
   I am a new Simcenter STAR-CCM+ user.Please use the attached license file to register for the following users.
   
   [Representative]
   - Account Name


   [Users (including representatives)]
   - Account Name
   - Account Name
      :

- [Sample 2] Application for use ((When using such as a PoD authentication method, not using the license server on Fugaku))

::
   
   I am a new Simcenter STAR-CCM+ user. I don't use the license server on Fugaku. Please register the following users.
   
   [Representative]
   - Account Name


   [Users (including representatives)]
   - Account Name
   - Account Name
      :

- [Sample 3] Change of licensed user

::
   
   We are changing the eligible users for the Simcenter STAR-CCM+ license currently in use.
   Please add/delete the following users.

   
   [Representative]
   - Account Name

   [Users (including representatives)]
   - Account Name
   - Account Name
   
- [Sample 4] Change of license file

::
   
   We updated our license file for using Simcenter STAR-CCM+.
   Please re-register using the attached license file.
   
   [Representative]
   - Account Name
   

The provided information will be used for the following purposes.

-  Setting up the software usage environment
-  Inquiry support


5. Notice of completion for software configuration
------------------------------------------------------

After the software environment settings are completed, the Fugaku Support will send a notice of completion for the software usage environment to the target user.


6. How to use
----------------

See below for details on use.

`https://www.fugaku.r-ccs.riken.jp/doc_root/en/user_guides/STARCCMGuide/usage_statccm_en.pdf <https://www.fugaku.r-ccs.riken.jp/doc_root/en/user_guides/STARCCMGuide/usage_starccm_en.pdf>`__

.. Please start using Simcenter STAR-CCM+ according to the "Fugaku Commercial Software Simcenter STAR-CCM+ Usage Procedure" in the Fugaku User Portal.
