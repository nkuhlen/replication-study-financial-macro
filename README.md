Replication of Jermann and Quadrini (2012)
==========================================

This project replicates and updates the analysis of the paper "Macroeconomic Effects of Financial Shocks" (AER 2012, 102(1): pp. 238-271) by Jermann and Quadrini.

Building the Project
--------------------

The project is built using [Waf](https://code.google.com/p/waf/). After a successful build, the full documentation of the project can be found in:
				
		project_documentation/index.html 


To run Waf and execute the files, you need to:

1. Save the project on your computer (clone the repository or save the zip file).

2. Install Miniconda or Anaconda in case they are not already installed and make sure that a LaTeX distribution can be found on your path.

3. Make sure a Matlab executable is added to your path. On Mac and Linux, this can be achieved by opening the bash profile in a shell and adding for example:

        # Matlab directory
        export PATH="${PATH}:/Applications/MATLAB_R2014b.app/bin"

    Details on how to open the bash profile in a shell and general instructions for adding programmes permanently to your path can be found [here](http://hmgaudecker.github.io/econ-python-environment/paths.html).

4. Navigate to the project folder in a shell and execute the following commands to create a conda environment (named as the current directory) with a minimal Python setup.

   **(Mac, Linux)**

        source set-env.sh

   **(Windows)**

        set-env.bat

     Details for setting up a Python environment can be found [here](http://hmgaudecker.github.io/econ-python-environment/).

5. Execute the following commands in the shell:

        python waf.py configure
        python waf.py build
        python waf.py install

    The execution of the first command will fail if any of the programmes required to run the project are not installed.
