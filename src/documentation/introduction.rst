.. _introduction:


************
Introduction
************

Documentation of our utility project, where we analyze large scale consumption and portfolio choice in an economy with two assets.
This introduction will explain the structure of the code and give an explanation over our design decisions, that is why we split up the code the way we did. The following parts of this documentation are then going to describe the different parts of our code in more detail.


.. _structure:

Structure
===============

The project calculates the optimal individual behaviour of an agent facing consumption and portfolio choices given his utility function and a set of assets. It requires various steps to be performed:

#. Specify the exogenous parameter values in the utility functions, assets as well as the estimation.
#. Calculate the optimal decision.
#. Visualise the results.
#. Summarise and describe the results in a paper.

The parameter values in step 1 are specified in JSON files in contrast to previous exercises where they were part of the python code. Step 2 and 3 make use of the prespecified folder structure to separate the creation of figures and tables from the calculation. The tex-file of the paper is contained in a separate folder which prevents cluttering up the root directory when compiling it.

Directories in the project correspond to the steps as follows:

    +-----------------+------+
    |  Directory      | Step |
    +=================+======+
    |  model_specs    |  1.  |
    +-----------------+------+
    |  model_code     |  2.  |
    +-----------------+------+
    |  analysis       |  2.  |
    +-----------------+------+
    |  final          |  3.  |
    +-----------------+------+
    |  documentation  |  4.  |
    +-----------------+------+
    |  paper          |  4.  |
    +-----------------+------+

.. _setting_parameters:

Set the Model Parameters
============================

The relevant specifications are contained in *src/model_specs* where they are stored in the respective ``.json`` files. They are stored in a separate directory so they might be reused at various places in the code.


.. _calculation:

Calculate the Optimal Decision
==============================

*src/analysis* contains the calculation of the optimal individual behaviour. Based on ``ez_utility_functions.py`` from the *src/model_code* folder, ``calc_ez_utility.py`` computes the optimal decision for a fixed choice of utility parameters. ``calc_ez_utility_grid.py`` calculates the optimal choice when varying the utility parameters over a grid. Separating the code into different modules is based on the fact that the procedures differ and the results correspond to different outputs. This simplifies subsequent visualisation steps. The respective results are saved as ``.pickle`` files in the *bld/out/analysis* folder. 

.. _visualisation:

Visualise the Results
=====================
*src/final* contains the visualisation and formatting of the results. In particular, ``table_preference_policy.py`` creates Table 1 from Exercise 4 in the *bld/out/tables* based on ``calc_ez_utility_results.pickle`` from the calculation step.
The module ``plot_ez_utility.py`` plots the graph from Exercise 4. That is, it reads in ``calc_ez_utility_grid_results.pickle`` and saves the resulting figure to *bld/out/figures*
As both modules only serve to visualise results from the analysis step they are places in the *src/final* rather than the *src/analysis* directory. The distinction between generation tables and creating figures follows the structure provided by the template.

.. _paper:

Paper and Documentation
=======================

*src/paper* contains the research paper. The documentation is stored in *src/documentation*. The paper contains the tables and figures from the visualisation step.
