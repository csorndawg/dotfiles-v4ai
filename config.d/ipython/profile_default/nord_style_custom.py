
#  Custom IPython Nord Theme
#
# To enable:
'''
To enable add the following to ipython/ipython_config.py:

    import sys
    sys.path.insert(0, '/home/zac/.ipython/profile_default')
    c.TerminalInteractiveShell.highlighting_style = 'nord_style.NordStyle'
'''


from pygments.style import Style
from pygments.token import *

class NordStyle(Style):
    background_color = '#2E3440'   # nord0
    default_style = ''
    styles = {
        Comment:            '#616E88',   # nord3 bright
        Keyword:            '#81A1C1',   # nord9
        Keyword.Type:       '#8FBCBB',   # nord7
        Name.Builtin:       '#88C0D0',   # nord8
        Name.Function:      '#88C0D0',
        String:             '#A3BE8C',   # nord14

        Number:             '#B48EAD',   # nord15
        Operator:           '#81A1C1',
        Token.Prompt:       'bold #88C0D0',
        Token.PromptNum:    'bold #A3BE8C',
        Token.OutPrompt:    '#BF616A',   # nord11
        Token.OutPromptNum: '#BF616A',
    }
