from visidata import Sheet, TableSheet, Canvas, BaseSheet

#
# Page Down / Page Up
#

def unbindKeys():
    # TODO
    # v      visual mode (map to select ?)
    # V      visual mode row 
    TableSheet.unbindkey('v');
    TableSheet.unbindkey('s');
    TableSheet.unbindkey('u');
    TableSheet.unbindkey('t');
    TableSheet.unbindkey('x');

#@Sheet.command(None, 'go-up-select')
def onSelectionMode():
    pass

def onNormalMode():
    pass

def bindKeys():
    TableSheet.bindkey('v', 'select-row');
    TableSheet.bindkey('V', 'unselect-row');
    #@Sheet.command('v', 'select-smart', 'smart paste')
    #def select_smart(sheet):
    #    sheet.toggle_row(sheet.cursorRow)

    #BaseSheet.bindkey('Alt+a', 'select-rows')


