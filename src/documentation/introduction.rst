.. _introduction:


************
Introduction
************

This project replicates and updates the analysis of the paper "Macroeconomic Effects of Financial Shocks" (AER 2012, 102(1): pp. 238-271) by Jermann and Quadrini. The project is built using the Project templates provided by Hans-Martin von Gaudecker at https://github.com/hmgaudecker/econ-project-templates. A general introduction to the project-build system waf and the design of the templates can be found at http://hmgaudecker.github.io/econ-project-templates/.

To run the entire project with waf, proceed as outlined in the README.md file contained in the main directory.

To make the scripts executable in the Matlab IDE, alternative path settings are included at the beginning of each script.

*Note*: The project was originally built using Matlab R2014b and Dynare 4.4.3. on a machine running Mac OS X 10.11.3. Using the exact same code with this version of Dynare under a different OS and in combination with a different version of Matlab has lead to different results in the past.

.. _structure:

Structure
===============

The main replication code lives in the **src** directory of the project root
folder. It is structured in six parts:

1. original_data
2. data_management
3. analysis
4. final
5. paper
6. documentation

Those parts will be explained in detail below.
