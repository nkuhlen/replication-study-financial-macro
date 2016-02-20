Replication of Jermann and Quadrini (2012)
==========================================

This project replicates and updates the analysis of the paper "Macroeconomic Effects of Financial Shocks" (AER 2012, 102(1): pp. 238-271) by Jermann and Quadrini.

Building the Project
--------------------

The project is built using [Waf](https://code.google.com/p/waf/). You will need a Python environment as described in detail [here](http://hmgaudecker.github.io/econ-python-environment/). To run Waf and execute the files, you need to:

#. Create a conda environment named as the current directory (returns-to-education in the above example) with a minimal Python setup. Navigate to the folder in a shell and execute 

   **(Mac, Linux)**

        source set-env.sh

    **(Windows)**

        set-env.bat

#. Execute the following commands in the shell:

        python waf.py configure
        python waf.py build
        python waf.py install



