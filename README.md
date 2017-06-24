Series of dCache Frontend Service Tests
=======================================

dCache Frontend Service is a Restful API for talking to dCache. This test can be only run after the system-test module have been successfully build and start.


Usage Instruction
=================

1. Install Robot Framework
2. Running the test


1. Robot Framework Installation Procedure
---------------------------------------------------------

How to install robot framework is well documented [here](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst). However, below is the installation procedure I will recommend:

####Pre-installation
Before installing robot framework, these following must be installed first:
1. Make sure you have python installed on your system.
2. Install pip if you don't have it already. Installation instruction can be found [here](https://pip.pypa.io/en/stable/installing/). _pip is a package management system used to install and manage software packages written in Python._

First check if pip is installed on system
>     pip -V

or
>     pip --version

If it is not install, run the following command
>     sudo easy_install pip

On Linux or macOS to update
>     pip install -U pip


####Installation
To install Robot Framework using pip, execute the following command
>     pip install robotframework

Upgrading to the latest version even if it is a pre-release
>     pip install --upgrade robotframework

Uninstall
>     pip uninstall robotframework


Check if everything is fine before proceeding
>     robot --version

If robot is install, you should see something like:
>     Robot Framework 3.0 (Python 2.7.10 on linux2)

####Post - Robot Installation
The system-test test for the frontend is using an external library called robotframework-requests.
Hence one needs to install the library dependency before install the library itself.

Via pip, execute the following command one after the other
>     pip install -U requests
>     pip install -U robotframework-requests


2. Running the test
-------------------
Once all the necessary dependencies had been installed, now you can run the test.
Change directory to where dcache source files.

###### For the whole frontend tests:

>     robot packages/system-test/target/bin/functional_test/frontend

######For a particular test:
>     robot packages/system-test/target/bin/functional_test/frontend/authentication-test/invalid_login_attempt.robot

######To test a particular test case in a test suite,
>     robot --test [name_of_the_test_case] [path_to_the_test_suite_where_the_test_case_is]

or

>     robot -t [name_of_the_test_case] [path_to_the_test_suite_where_the_test_case_is]

For example to test a test case with name: _Send A GET Requests Without Suppressing WWW-Authenticate_ and this is located inside _packages/frontend/authentication-test/invalid_login_attempt.robot_ ; your robot command test will look like this:
>     robot --test 'Send A GET Requests Without Suppressing WWW-Authenticate' packages/system-test/target/bin/functional_test/frontend/authentication-test/invalid_login_attempt.robot

######For a particular tag:
>     robot -i xxx

By default, the system-test uses default credentials, that is, username and password. This might not work if it not setup properly. Therefore, to use a specific username and password, simply do this:
>     robot --variable username:[enter_username_here] --variable password:[enter_password_here] packages/system-test/target/bin/functional_test/frontend