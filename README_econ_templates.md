Templates for Reproducible Research Projects in Economics
===========================================================

*See* http://hmgaudecker.github.io/econ-project-templates/ *for the full documentation.*

An empirical or computational research project only becomes a useful building block for science when **all** steps can be easily repeated and modified by others. This means that we should automate as much as possible, compared to pointing and clicking with a mouse or, more generally, keeping track yourself of what needs to be done.

This is a collection of templates where much of this automation is pre-configured via describing the research workflow as a directed acyclic graph ([DAG](http://en.wikipedia.org/wiki/Directed_acyclic_graph)) using [Waf](https://code.google.com/p/waf/). You just need to:

* Download the template for the main language in your project (Stata, R, Matlab, Python, ...)
* Move your programs to the right places and change the placeholder scripts
* Run Waf, which will build your entire project the first time you run it. Later, it will automatically figure out which parts of the project need to be rebuilt.

The branch names follow the main language used in a particular example. You should base your project on the branch that specifies the language that you will use most. You can easily add more languages to your projects, this is just a single line if the language is supported. Consult the different branches for examples.


Full documentation
------------------

*See* http://hmgaudecker.github.io/econ-project-templates/ *for the full documentation (in the context of a Python-based project, but this is easy enough to abstract from). Please read it before continuing with instructions that follow.*


Getting started (Matlab-based project)
---------------------------------------------

1. Download the [zip file](https://github.com/hmgaudecker/econ-project-templates/archive/matlab.zip) or clone the project. Copy the contents of the template to the place on your machine where you want the resulting project to live, e.g.

        C:\Projects\structural-retirement-model\

   Make sure that the entire path **does not contain any spaces**. Things may work in the beginning, but they will break eventually.

2. Use the "find in project"-functionality of your editor to search and replace the following terms:

        NNN -> Your name
        UUU -> Your affiliation
        TTT -> The title of the project

3. Make sure to have [Miniconda](http://conda.pydata.org/miniconda.html) or Anaconda installed. Matlab and a modern LaTeX distribution (e.g. [TeXLive](www.tug.org/texlive/), [MacTex](http://tug.org/mactex/), or [MikTex](http://miktex.org/)) need to be found on your path.

4. Navigate to the folder in a shell. Execute 

   **(Mac, Linux)**

        source set-env.sh

    **(Windows)**

        set-env.bat

    This will create a conda environment named as the current directory (returns-to-education in the above example) with a minimal Python setup.

    A detailed set of instructions for setting up an entire Python environment may be found [here](http://hmgaudecker.github.io/econ-python-environment).

4. Type the following commands to see whether the examples are working:

        python waf.py configure
        python waf.py build
        python waf.py install

   The first command will fail if any one of the required programs cannot be found. 

   If the second step fails, try the following in order to localise the problem (otherwise you may have many parallel processes started and it will be difficult to find out which one failed):

        python waf.py build -j1

    If everything worked without error, you may now find more information on how to use the project template in "project_documentation/index.html".
