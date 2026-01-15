:orphan:

.. toctree::
   :maxdepth: 2
   :numbered:

.. highlight:: none

Ansys Fluent  - Flow to Start Using
==============================================

The step to using Ansys Fluent on Fugaku are as follows.

Note that some procedures depend on the activation method used.


- When using the license server on Fugaku : Go to Step No 1-6
- When not using a license server on Fugaku, like using such as Ansys Elastic Licensing authentication : Go to Step No 1,4-6


#. License Agreement
#. Inquiry for license server information
#. Contacting License Server Information
#. Application for use and request for change of application contents
#. Notice of completion for software configuration
#. How to use

.. figure:: FIGURES/fluent1.png
   :width: 6.29921in

   Fig. 1. Workflow of using Ansys Fluent (When using the license server on Fugaku)

.. figure:: FIGURES/fluent2.png
   :width: 6.29921in
 
   Fig. 2. Workflow of using Ansys Fluent (When not using a license server on Fugaku, like using such as Ansys Elastic Licensing authentication)


1. License Agreement
-----------------------

A license agreement is required to use Ansys Fluent on Fugaku.

Please contact the following software vendor for details of the license agreement.

   **[Software Vendors]**

   Ansys Inc.

   **[Product Information]**

   https://www.ansys.com/products/fluids/ansys-fluent

   **[Contact]**
   
   https://www.ansys.com/contact-us?pi=fluid-dynamics

2. Inquiry for license server information
---------------------------------------------

If you want to use a license server on Fugaku, please contact Fugaku Support for license server information using the template below after signing the license agreement.
This step is not necessary if you use such as Ansys Elastic Licensing authentication without using the license server on Fugaku, please go to Step No 4.

**As a rule, license server information does not change. When updating the expiration date of a license file, the same license server information should be used.**

#. Access to Fugaku Support site (https://fugaku.zendesk.com/hc/en-us) and press "Request"
#. Select "Use of commercial application" from "Request type"
#. Select "Project ID" from "Project ID for this request"
#. Enter "License Server Information Inquiry" in "Subject"
#. Select "Fluent" from "Application Name"
#. Press "Submit"

The Fugaku Support will notify you of the license server information.

3. Contacting License Server Information
--------------------------------------------

Please contact the licensee with the license server information notified by the Fugaku Support in the "Inquiry for License Server Information" section.
This step is not necessary if you use such as Ansys Elastic Licensing authentication without using the license server on Fugaku, please go to Step No 4.

4. Application for use and request for change of application contents
-------------------------------------------------------------------------

If you want to use a license server on Fugaku, after receiving the license file from the licensee, please follow the procedure below to send the license file. The license file will be registered and configured by the commercial software maintenance staff.

If you want to use such as Ansys Elastic Licensing authentication without using the license server on Fugaku, please follow the steps below after signing the license agreement.

Please be sure to include the Fugaku local account of one representative and all members who will use the license.

Please follow the same procedure when you change the application contents. Please be sure to include the Fugaku local account of one representative designated at the time of registration. The license file does not need to be attached if there are no changes.

#. Access to Fugaku Support site (https://fugaku.zendesk.com/hc/en-us) and press "Request"
#. Select "Use of commercial application" from "Request type"
#. Select "Project ID" from "Project ID for this request"
#. Enter "EXAMPLE: Start of use (Fluent)" in "Subject"
#. Select "Fluent" from "Application Name"
#. Enter inquiry details in "Supplement" with reference to the following [Sample]
#. Attach the license file if necessary
#. Press "Submit"

- [Sample 1] Register a new license file

::
   
   I am a new Ansys Fluent user. Please use the attached license file to register for the following users.
   
   [Representative]
   - Account Name


   [Users (including representatives)]
   - Account Name
   - Account Name
      :

- [Sample 2] Application for use (When not using a license server on Fugaku, like using such as Ansys Elastic Licensing authentication)

::
   
   I am a new Ansys Fluent user. I don't use the license server on Fugaku. Please register the following users.
   
   [Representative]
   - Account Name


   [Users (including representatives)]
   - Account Name
   - Account Name
      :

- [Sample 3] Change of licensed user

::
   
   We are changing the eligible users for the Ansys Fluent license currently in use.
   Please add/delete the following users.

   
   [Representative]
   - Account Name

   [Users (including representatives)]
   - Account Name
   - Account Name
   
- [Sample 4] Change of license file

::
   
   We updated our license file for using Ansys Fluent.
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

`https://www.fugaku.r-ccs.riken.jp/doc_root/en/user_guides/FluentGuide/usage_fluent_en.pdf <https://www.fugaku.r-ccs.riken.jp/doc_root/en/user_guides/FluentGuide/usage_fluent_en.pdf>`__

