Replication of Jermann and Quadrini (2012)
==========================================

This project replicates and updates the analysis of the paper "Macroeconomic Effects of Financial Shocks" (AER 2012, 102(1): pp. 238-271) by Jermann and Quadrini. You can find the project documentation in the folder *project_documentation*.

Building the Project
--------------------

The project is built using [Waf](https://code.google.com/p/waf/). This ensures reproducibility by automating the  workflow. To run Waf and execute the files, you need to:

1. Clone the project or download the zip file.

2. Navigate to the folder in a shell. Execute 

   **(Mac, Linux)**

        source set-env.sh

    **(Windows)**

        set-env.bat

    This will create a conda environment named as the current directory (returns-to-education in the above example) with a minimal Python setup.

    A detailed set of instructions for setting up an entire Python environment may be found [here](http://hmgaudecker.github.io/econ-python-environment).

3. Execute the following commands in the shell:

        python waf.py configure
        python waf.py build
        python waf.py install


Steps in the Project
--------------------

This section will outline the single steps executed by Waf. 

1. Data management: Read in the original data in *orignal data* and create .mat file containing the transformed variables necessary to reproduce Figure 1 in Jermann and Quadrini (2012)

2. Plot Figure 1 using the data from step 1 and save it in the *bld/out/figures*.

3. Compile the Latex file in *paper* using the figures from step 3.

