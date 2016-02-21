Replication of Jermann and Quadrini (2012)
==========================================

This project replicates and updates the analysis of the paper "Macroeconomic Effects of Financial Shocks" (AER 2012, 102(1): pp. 238-271) by Jermann and Quadrini.

Building the Project
--------------------

The project is built using [Waf](https://code.google.com/p/waf/). After a successful build, the full documentation of the project can be found in:
				
		project_documentation/index.html 


To run Waf and execute the files, you need to:

1. Save the project on your computer (clone the repository or save the zip file).

2. Install Miniconda or Anaconda in case they are not already installed. Add a LaTeX distribution to your path.

3. Navigate to the project folder in a shell and execute the following commands to create a conda environment (named as the current directory) with a minimal Python setup.

   **(Mac, Linux)**

        source set-env.sh

   **(Windows)**

        set-env.bat

     Details for setting up a Python environment can be found [here](http://hmgaudecker.github.io/econ-python-environment/).

4. Execute the following commands in the shell:

        python waf.py configure
        python waf.py build
        python waf.py install

    The execution of the first command will fail if any of the programmes required to run the project are not installed.
