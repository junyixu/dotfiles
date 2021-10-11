# sample ipython_config.py

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20
# c.InteractiveShellApp.extensions = [
#     'myextension'
# ]
c.InteractiveShellApp.exec_lines = [
    'import numpy as np', 'from matplotlib import pyplot as plt'
]
# c.InteractiveShellApp.exec_files = [
#     'mycode.py',
#     'fancy.ipy'
# ]
# c.InteractiveShell.colors = 'LightBG'
c.InteractiveShell.confirm_exit = False
# c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'
c.TerminalInteractiveShell.highlighting_style = 'inkpot'
c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [('la', 'ls -al')]

# vim mode
c.TerminalInteractiveShell.editing_mode = 'vi'
