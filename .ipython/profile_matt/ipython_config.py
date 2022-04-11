# Configuration file for ipython.

#------------------------------------------------------------------------------
# InteractiveShellApp(Configurable) configuration
#------------------------------------------------------------------------------
## A Mixin for applications that start InteractiveShell instances.
#  
#      Provides configurables for loading extensions and executing files
#      as part of configuring a Shell environment.
#  

## Execute the given command string.
#  Default: ''
# c.InteractiveShellApp.code_to_run = ''

## List of files to run at IPython startup.
#  Default: []
c.InteractiveShellApp.exec_files = ["/home/mcjones/.ipython/profile_matt/ipython_startup.py"]

## lines of code to run at IPython startup.
#  Default: []
c.InteractiveShellApp.exec_lines = [
        "from flightcondition import Atmosphere as Atm, FlightCondition as FC, unit, dimless",
        ]

## Pre-load matplotlib and numpy for interactive use,
#          selecting a particular matplotlib backend and loop integration.
#  Choices: any of ['auto', 'agg', 'gtk', 'gtk3', 'gtk4', 'inline', 'ipympl', 'nbagg', 'notebook', 'osx', 'pdf', 'ps', 'qt', 'qt4', 'qt5', 'qt6', 'svg', 'tk', 'widget', 'wx'] (case-insensitive) or None
#  Default: None
# c.InteractiveShellApp.pylab = None
